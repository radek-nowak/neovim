return {
        'anuvyklack/hydra.nvim',

        config = function()
                local Hydra = require("hydra")

                Hydra({
                        name = "Change / Resize Window",
                        mode = { "n" },
                        body = "<leader>hw",
                        config = {
                                -- color = "pink",
                        },
                        heads = {
                                -- move between windows
                                { "<C-h>", "<C-w>h" },
                                { "<C-j>", "<C-w>j" },
                                { "<C-k>", "<C-w>k" },
                                { "<C-l>", "<C-w>l" },

                                -- resizing window
                                { "H",     "<C-w>3<" },
                                { "L",     "<C-w>3>" },
                                { "K",     "<C-w>2+" },
                                { "J",     "<C-w>2-" },

                                -- equalize window sizes
                                { "e",     "<C-w>=" },

                                -- close active window
                                { "Q",     ":q<cr>" },
                                { "<C-q>", ":q<cr>" },

                                -- exit this Hydra
                                { "q",     nil,      { exit = true, nowait = true } },
                                { ";",     nil,      { exit = true, nowait = true } },
                                { "<Esc>", nil,      { exit = true, nowait = true } },
                        },
                })

                local dap = require 'dap'

                local hint = [[
 _n_: step over   _s_: Continue/Start   _b_: Breakpoint     _K_: Eval
 _i_: step into   _x_: Quit             ^ ^                 ^ ^
 _o_: step out    _X_: Stop             ^ ^
 _c_: to cursor   _C_: Close UI
 ^
 ^ ^              _q_: exit
]]

                local dap_hydra = Hydra({
                        hint = hint,
                        config = {
                                color = 'pink',
                                invoke_on_body = true,
                                hint = {
                                        position = 'bottom',
                                        border = 'rounded'
                                },
                        },
                        name = 'dap',
                        mode = { 'n', 'x' },
                        body = '<leader>dh',
                        heads = {
                                { 'n', dap.step_over,                                                      { silent = true } },
                                { 'i', dap.step_into,                                                      { silent = true } },
                                { 'o', dap.step_out,                                                       { silent = true } },
                                { 'c', dap.run_to_cursor,                                                  { silent = true } },
                                { 's', dap.continue,                                                       { silent = true } },
                                { 'x', ":lua require'dap'.disconnect({ terminateDebuggee = false })<CR>",  { exit = true, silent = true } },
                                { 'X', dap.close,                                                          { silent = true } },
                                { 'C', ":lua require('dapui').close()<cr>:DapVirtualTextForceRefresh<CR>", { silent = true } },
                                { 'b', dap.toggle_breakpoint,                                              { silent = true } },
                                { 'K', ":lua require('dap.ui.widgets').hover()<CR>",                       { silent = true } },
                                { 'q', nil,                                                                { exit = true, nowait = true } },
                        }
                })

                Hydra.spawn = function(head)
                        if head == 'dap-hydra' then
                                dap_hydra:activate()
                        end
                end
        end,

}
