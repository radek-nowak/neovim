local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>k", function()
    vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>xe", function()
    vim.cmd.RustLsp("explainError")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>dd", function()
    vim.cmd.RustLsp("debuggables")
end, { silent = true, buffer = bufnr })
