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
            require("go").setup({})
        end,
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
            vim.api.nvim_set_keymap('n', '<leader>im', [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]], {noremap=true, silent=true})
        end,
    },
}
