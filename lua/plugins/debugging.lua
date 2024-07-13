-- return {
-- 	"mfussenegger/nvim-dap",
-- 	dependencies = {
-- 		"leoluz/nvim-dap-go",
-- 		"nvim-neotest/nvim-nio",
-- 		"rcarriga/nvim-dap-ui",
-- 	},
-- 	config = function()
-- 		require("dapui").setup()
-- 		require("dap-go").setup()
--
-- 		local dap, dapui = require("dap"), require("dapui")
--
-- 		dap.listeners.before.attach.dapui_config = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.launch.dapui_config = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.event_terminated.dapui_config = function()
-- 			dapui.close()
-- 		end
-- 		dap.listeners.before.event_exited.dapui_config = function()
-- 			dapui.close()
-- 		end
--
-- 		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
-- 		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
-- 		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
-- 		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
-- 	end,
-- }
return {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "folke/neodev.nvim",
        "nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local virtual_text = require("nvim-dap-virtual-text")
        local dap_go = require("dap-go")

        dap.adapters.lldb = {
            type = 'executable',
            command = '/home/radek/.local/share/nvim/mason/bin/codelldb', -- adjust as needed, must be absolute path
            name = 'lldb'
        }

        local lldb = {
            name = "Launch lldb",
            type = "lldb",      -- matches the adapter
            request = "launch", -- could also attach to a currently running process
            program = function()
                return vim.fn.input(
                    "Path to executable: ",
                    vim.fn.getcwd() .. "/",
                    "file"
                )
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        }

        dap.configurations.rust = {
            lldb
        }

        dapui.setup()
        virtual_text.setup()
        dap_go.setup()
		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
		vim.keymap.set({"n", "v"}, "<Leader>qe", function ()
		  dapui.eval()
		end)
    end
}

