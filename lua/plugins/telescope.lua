return {
        {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.5",
                dependencies = { "nvim-lua/plenary.nvim" },
                config = function()
                        local telescope = require("telescope")
                        require("telescope").setup({
                                defaults = {
                                        vertical = { width = 0.5 }

                                },
                                pickers = {
                                        colorscheme = {
                                                enable_preview = true,
                                        },
                                },
                        })
                        -- TODO: add todo comment
                        local builtin = require("telescope.builtin")
                        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
                        vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
                        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
                        vim.keymap.set("n", "<leader>su", builtin.lsp_references, {})
                        vim.keymap.set("n", "<leader>fm", builtin.marks, {})
                        vim.keymap.set("n", "<space>.", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
                        -- vim.keymap.set("n", "<space>:", builtin.commands, {}) -- TODO: execute command on <CR>, improve formatting
                        -- vim.keymap.set("n", "<space>fS", builtin.lsp_dynamic_workspace_symbols, {})
                        vim.keymap.set("n", "<space>fS",
                                ":Telescope lsp_dynamic_workspace_symbols path=%:p:h select_buffer=true<CR>", {})
                        vim.keymap.set("n", "<space>fs", builtin.lsp_workspace_symbols, {})
                        vim.keymap.set("n", "<space>fi", builtin.lsp_implementations, {})

                        telescope.load_extension("makefile_targets")
                        -- telescope.load_extension("document_symbols") -- TODO: fix errors, needs testing
                end
        },
        {
                "nvim-telescope/telescope-ui-select.nvim",
                config = function()
                        require("telescope").setup({
                                extensions = {
                                        ["ui-select"] = {
                                                require("telescope.themes").get_dropdown({}),
                                        },
                                },
                        })
                        require("telescope").load_extension("ui-select")
                end,
        },
        {
                "nvim-telescope/telescope-file-browser.nvim",
                dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        }

}
