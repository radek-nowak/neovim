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
        },
      },
    })
  end,
  opts = {
  },
}
}
