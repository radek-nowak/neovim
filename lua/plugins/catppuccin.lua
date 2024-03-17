return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({ no_italic = true })
		vim.cmd.colorscheme("catppuccin-macchiato")
		-- Hide semantic highlights for functions
		vim.api.nvim_set_hl(0, "@lsp.type.function", {})
		-- Hide all semantic highlights
		for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
			vim.api.nvim_set_hl(0, group, {})
		end
	end,
	enabled = true,
}
