-- return{}
return {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
                -- Snippet Engine & its associated nvim-cmp source
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",

                -- Adds LSP completion capabilities
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",

                -- Adds a number of user-friendly snippets
                "rafamadriz/friendly-snippets",

                -- Adds vscode-like pictograms
                "onsails/lspkind.nvim",
        },
        config = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")
                -- local lspkind = require("lspkind")

                local kind_icons = {
                        Text = "",
                        Method = "󰆧",
                        Function = "󰊕",
                        Constructor = "",
                        Field = "󰇽",
                        Variable = "󰂡",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Snippet = "",
                        Color = "󰏘",
                        File = "󰈙",
                        Reference = "",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "󰅲",
                }
                require("luasnip.loaders.from_vscode").lazy_load()
                luasnip.config.setup({})

                cmp.setup({
                        snippet = {
                                expand = function(args)
                                        luasnip.lsp_expand(args.body)
                                end,
                        },
                        completion = {
                                completeopt = "menu,menuone,noinsert",
                        },
                        mapping = cmp.mapping.preset.insert({
                                ["<C-j>"] = cmp.mapping.select_next_item(),
                                ["<C-k>"] = cmp.mapping.select_prev_item(),
                                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                                ["<C-u>"] = cmp.mapping.scroll_docs(4),
                                ["<C-Space>"] = cmp.mapping.complete({}),
                                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                                ["<CR>"] = cmp.mapping.confirm({
                                        behavior = cmp.ConfirmBehavior.Adds,
                                        select = true,
                                }),
                                -- ["<TAB>"] = cmp.mapping.confirm({
                                --         -- behavior = cmp.ConfirmBehavior.Replace,
                                --         select = true,
                                -- }),
                                ["<Tab>"] = cmp.mapping(function(fallback)
                                        -- if cmp.visible() then
                                                -- cmp.select_next_item()
                                        if luasnip.expand_or_locally_jumpable() then
                                                luasnip.expand_or_jump()
                                        else
                                                fallback()
                                        end
                                end, { "i", "s" }),
                                ["<S-Tab>"] = cmp.mapping(function(fallback)
                                        if cmp.visible() then
                                                cmp.select_prev_item()
                                        elseif luasnip.locally_jumpable(-1) then
                                                luasnip.jump(-1)
                                        else
                                                fallback()
                                        end
                                end, { "i", "s" }),
                        }),
                        window = {
                                completion = cmp.config.window.bordered(),
                                documentation = cmp.config.window.bordered(),
                        },

                        preselect = cmp.PreselectMode.None,
                        sources = {
                                -- { name = "copilot" },
                                { name = "luasnip" },
                                { name = "buffer" },
                                { name = "nvim_lsp" },
                                { name = "nvim_lua" },
                                { name = "path" },
                                { name = "calc" },
                                { name = "emoji" },
                                { name = "treesitter" },
                                { name = "crates" },
                                { name = "tmux" },
                        },
                        formatting = {
                                format = function(entry, vim_item)
                                        local lspkind_ok, lspkind = pcall(require, "lspkind")
                                        if not lspkind_ok then
                                                -- From kind_icons array
                                                vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind],
                                                        vim_item.kind)
                                                -- Source
                                                vim_item.menu = ({
                                                        nvim_lsp = "[LSP]",
                                                        luasnip = "[LuaSnip]",
                                                        buffer = "[Buffer]",
                                                        nvim_lua = "[Lua]",
                                                        copilot = "[Copilot]",
                                                        latex_symbols = "[LaTeX]",
                                                })[entry.source.name]
                                                return vim_item
                                        else
                                                -- From lspkind
                                                return lspkind.cmp_format()(entry, vim_item)
                                        end
                                end,
                        },
                })
        end,
}
