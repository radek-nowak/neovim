return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "rust_analyzer", "html" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.gopls.setup({ capabilities = capabilities, hint = { enable = true } })
            lspconfig.lua_ls.setup({ capabilities = capabilities, hint = { enable = true } })
            lspconfig.html.setup({ capabilities = capabilities, hint = { enable = true } })

            vim.keymap.set("n", "<space>qe", vim.diagnostic.open_float)
            vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<space>qq", vim.diagnostic.setloclist)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<space>re", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<space>cf", function()
                vim.lsp.buf.format({ async = true })
            end)
        end,
    },
    enabled = true,
}
