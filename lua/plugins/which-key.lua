return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wk = require("which-key")
			wk.register({
				["<leader>"] = {
					f = {
						name = "+file",
						f = "Find File",
						w = "Live Grep",
                        r = "Recent files"
					},
					a = "Add to Harpoon",
					d = {
						name = "+debug",
					},
					x = {
						name = "+trouble",
						x = "Toggle",
						w = "Workspace diagnostics",
						d = "Document diagnostics",
						q = "Quickfix",
						l = "Loclist",
					},
					c = {
						name = "+code",
						a = "Actions",
						f = "Format",
					},
				},
			})
		end,
		opts = {},
	},
}
