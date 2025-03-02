-- function Harpoon_files()
--         local harpoon = require("harpoon")
--         local contents = {}
--         local marks_length = harpoon:list():length()
--         local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
--         for index = 1, marks_length do
--                 local harpoon_file_path = harpoon:list():get(index).value
--                 local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ":t")
--
--                 if current_file_path == harpoon_file_path then
--                         contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index,
--                                 file_name)
--                 else
--                         contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index,
--                                 file_name)
--                 end
--         end
--
--         return table.concat(contents)
-- end
--
-- return {
--         "nvim-lualine/lualine.nvim",
--
--         config = function()
--                 require("lualine").setup({
--                         options = {
--                                 component_separators = { left = "", right = "" },
--                                 section_separators = { left = "", right = "" },
--                         },
--
--                         sections = {
--                                 lualine_a = { 'mode' },
--                                 lualine_b = {},
--                                 lualine_c = { 'filename', 'location' },
--                                 lualine_x = { 'encoding', 'fileformat', 'filetype', 'branch', 'diff', 'diagnostics' },
--                                 lualine_y = {},
--                                 lualine_z = {}
--                         },
--                         -- tabline = {
--                         --     lualine_a = { Harpoon_files },
--                         --     lualine_x = {
--                         --         {
--                         --             "datetime",
--                         --             -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
--                         --             style = "default",
--                         --         },
--                         --     },
--                         -- },
--                 })
--         end,
-- }

local M = {
        "nvim-lualine/lualine.nvim",
        config = function()
                local lualine = require("lualine")

                -- Funkcja do włączania/wyłączania lualine
                local lualine_active = true
                function ToggleLualine()
                        if lualine_active then
                                lualine_active = false
                                lualine.hide()
                                print("Lualine disabled")
                        else
                                lualine_active = true
                                lualine.setup({
                                        options = {
                                                component_separators = { left = "", right = "" },
                                                section_separators = { left = "", right = "" },
                                        },
                                        sections = {
                                                lualine_a = { 'mode' },
                                                lualine_b = {},
                                                lualine_c = { 'filename', 'location' },
                                                lualine_x = { 'encoding', 'fileformat', 'filetype', 'branch', 'diff', 'diagnostics' },
                                                lualine_y = {},
                                                lualine_z = {}
                                        },
                                })
                                print("Lualine enabled")
                        end
                end

                -- Konfiguracja lualine
                lualine.setup({
                        options = {
                                globalstatus = true,
                                component_separators = { left = "", right = "" },
                                section_separators = { left = "", right = "" },
                        },
                        sections = {
                                lualine_a = { 'mode' },
                                lualine_b = {},
                                lualine_c = { 'filename', 'location' },
                                lualine_x = { 'encoding', 'fileformat', 'filetype', 'branch', 'diff', 'diagnostics' },
                                lualine_y = {},
                                lualine_z = {}
                        },
                })

                -- Skrót klawiszowy do przełączania lualine
                vim.keymap.set("n", "<leader>ll", ToggleLualine, { noremap = true, silent = true })
        end,
}

return M
