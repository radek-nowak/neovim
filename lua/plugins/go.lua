-- return {
-- 	"ray-x/go.nvim",
-- 	dependencies = { -- optional packages
-- 		"ray-x/guihua.lua",
-- 		"neovim/nvim-lspconfig",
-- 		"nvim-treesitter/nvim-treesitter",
-- 	},
-- 	config = function()
-- 		require("go").setup()
-- 	end,
-- 	event = { "CmdlineEnter" },
-- 	ft = { "go", "gomod" },
-- 	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
-- }

---@param types string[] Will return the first node that matches one of these types
---@param node TSNode|nil
---@return TSNode|nil
local function find_node_ancestor(types, node)
        if not node then
                return nil
        end

        if vim.tbl_contains(types, node:type()) then
                return node
        end

        local parent = node:parent()

        return find_node_ancestor(types, parent)
end

local function lower_first_char(str)
        return str:sub(1, 1):lower() .. str:sub(2)
end

local function upper_first_char(str)
        return str:sub(1, 1):upper() .. str:sub(2)
end

---@param type_node TSNode
local function node_name(type_node)
        return vim.treesitter.get_node_text(type_node, 0)
end

---Check if a Go field is exported
---@param field_name string
---@return boolean
local function is_exported(field_name)
        local first_char = field_name:sub(1, 1)
        return first_char:match("%u") ~= nil
end

local receiver_type = {
        pointer = 1,
        value = 2
}

local function receiver(type_name, type)
        if type == receiver_type.pointer then
                return "*" .. type_name
        else
                return type_name
        end
end

---@param field_node TSNode
local generate_single_getter = function(field_node, opts)
        local ts_utils = require("nvim-treesitter/ts_utils")

        -- field
        if field_node:type() ~= 'field_identifier' then
                print("Not a field identifier")
                return
        end

        local field_name = node_name(field_node)

        if is_exported(field_name) then
                print("Cannot generate getter for an exported field " .. field_name)
                return
        end

        -- field data type
        --BUG: case for no data type
        local field_type_node = field_node:next_sibling()
        if not field_type_node then
                print("No data type found")
                return
        end

        local field_type_name = node_name(field_type_node)

        local type_spec_node = find_node_ancestor({ 'type_spec' }, field_node)
        if not type_spec_node then
                return
        end

        local type_name_node = ts_utils.get_named_children(type_spec_node)[1]
        local type_name = node_name(type_name_node)

        local receiver_name = lower_first_char(type_name)
        local method_name = upper_first_char(field_name)

        local flags = {}

        for _, arg in ipairs(opts.fargs) do
                if arg == "--value" or arg == "-v" then
                        flags.value_receiver = true
                end
        end

        local rec
        if flags.value_receiver then
                rec = receiver(type_name, receiver_type.value)
        else
                rec = receiver(type_name, receiver_type.pointer)
        end

        local end_row, _ = type_spec_node:end_()
        local indent = string.rep(" ", vim.fn.indent(end_row))

        local getter_lines = {
                "", -- blank line
                string.format("func (%s %s) %s() %s {", receiver_name, rec, method_name, field_type_name),
                string.format("%sreturn %s.%s", indent, receiver_name, field_name),
                "}",
        }
        vim.api.nvim_buf_set_lines(0, end_row + 1, end_row + 1, false, getter_lines)
end

local generate_getter = function(opts)
        local field_node = vim.treesitter.get_node()
        if not field_node then
                print("Unable to find the field")
                return
        end
        generate_single_getter(field_node, opts)
        -- TODO: getters for unexported fields?
end

local generate_getter_list = function(opts)
        -- Get the selected text (visual mode selection)
        local start_line = opts.line1 - 1 -- Treesitter is 0-indexed
        local end_line = opts.line2 - 1   -- Treesitter is 0-indexed
        local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line + 1, false)

        -- Get Treesitter parser for the current buffer
        local parser = vim.treesitter.get_parser(0)
        local tree = parser:parse()[1] -- Get the first syntax tree
        local root = tree:root()       -- Get the root node

        -- Define a query to find field_identifier nodes within field_declaration
        local query = vim.treesitter.query.parse('go', [[
        (field_declaration_list
                (field_declaration
                        (field_identifier) @field_name
                        )
                )
    ]])

        -- Iterate through all matches for this query in the selected range
        local match_found = false
        for _, captures in query:iter_matches(root, start_line, end_line + 1) do
                -- captures[1] corresponds to the field_identifier node
                local field_node = captures[1]

                -- Print debug information for each match
                if field_node then
                        local field_name = vim.treesitter.get_node_text(field_node, 0)
                        -- Call generate_single_getter for each found field
                        generate_single_getter(field_node, opts)
                        match_found = true
                else
                        print("No field node found in this match.")
                end
        end

        -- If no fields were found, print a debug message
        if not match_found then
                print("No fields found in the selected range.")
        end
end


-- Register the user command "Getter" that works in visual mode
vim.api.nvim_create_user_command("Getters", generate_getter_list, {
        range = true, -- This allows the command to be used with a visual range
        nargs = "*",  -- No arguments needed
        bang = false, -- The command does not accept a bang
})

vim.api.nvim_create_user_command("Getter", generate_getter, { nargs = "*" })

return {
        {
                "ray-x/go.nvim",
                dependencies = { -- optional packages
                        "ray-x/guihua.lua",
                        "neovim/nvim-lspconfig",
                        "nvim-treesitter/nvim-treesitter",

                        "leoluz/nvim-dap-go",
                },
                config = function()
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        vim.notify = require("notify")

                        require("go").setup({
                                capabilities = capabilities,
                                -- lsp_on_attach = require("plugins.lsp.on_attach").on_attach,
                                null_ls = false,
                                lsp_inlay_hints = {
                                        enable = true, -- this is the only field apply to neovim > 0.10

                                        -- following are used for neovim < 0.10 which does not implement inlay hints
                                        -- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
                                        style = 'inlay',
                                },
                                lsp_cfg = {
                                        settings = {
                                                gopls = {
                                                        gofumpt = true,
                                                        codelenses = {
                                                                gc_details = false,
                                                                generate = true,
                                                                regenerate_cgo = true,
                                                                run_govulncheck = true,
                                                                test = true,
                                                                tidy = true,
                                                                upgrade_dependency = true,
                                                                vendor = true,
                                                        },
                                                        hints = {
                                                                assignVariableTypes = false,
                                                                compositeLiteralFields = false,
                                                                compositeLiteralTypes = false,
                                                                constantValues = false,
                                                                functionTypeParameters = false,
                                                                parameterNames = false,
                                                                rangeVariableTypes = false,
                                                        },
                                                        analyses = {
                                                                nilness = true,
                                                                unusedparams = true,
                                                                unusedwrite = true,
                                                                useany = true,
                                                        },
                                                        usePlaceholders = true,
                                                        completeUnimported = true,
                                                        staticcheck = true,
                                                        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                                                        semanticTokens = false,
                                                },
                                        },
                                },
                                luasnip = true,
                                trouble = true,
                        })
                end,
                --         require("go").setup({
                --                 lsp_codelens = true
                --
                --         })
                -- end,
                event = { "CmdlineEnter" },
                ft = { "go", "gomod" },
                build = ':lua require("go.install").update_all_sync()',
        },
        {
                'edolphin-ydf/goimpl.nvim',
                dependencies = {
                        { 'nvim-lua/plenary.nvim' },
                        { 'nvim-telescope/telescope.nvim' },
                        { 'nvim-treesitter/nvim-treesitter' },
                },
                config = function()
                        require 'telescope'.load_extension 'goimpl'
                        vim.api.nvim_set_keymap('n', '<leader>im',
                                [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
                                { noremap = true, silent = true })
                end,
        },
}
