return {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" }
        opts = {},
        config = function()
                local fzf = require("fzf-lua")
                require("fzf-lua").setup({
                        vim.keymap.set("n", "<leader><leader>", fzf.files),
                        vim.keymap.set("n", "<leader>:", fzf.commands),
                        vim.keymap.set("n", "<leader>fr", fzf.oldfiles),
                        vim.keymap.set("n", "<leader>fww", fzf.live_grep),
                        vim.keymap.set("n", "<leader>fwb", fzf.lgrep_curbuf)
                })
        end
}
