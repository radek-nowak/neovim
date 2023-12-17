return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({}) 
    require("mason-lspconfig").setup({})

    require("lspconfig").lua_ls.setup({})
  end
}

