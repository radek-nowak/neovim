local function gruvbox()
        return function()
                require("catppuccin").setup({
                        background = {
                                light = "latte",
                                dark = "mocha",
                        },
                        color_overrides = {
                                latte = {
                                        rosewater = "#c14a4a",
                                        flamingo = "#c14a4a",
                                        red = "#c14a4a",
                                        maroon = "#c14a4a",
                                        pink = "#945e80",
                                        mauve = "#945e80",
                                        peach = "#c35e0a",
                                        yellow = "#b47109",
                                        green = "#6c782e",
                                        teal = "#4c7a5d",
                                        sky = "#4c7a5d",
                                        sapphire = "#4c7a5d",
                                        blue = "#45707a",
                                        lavender = "#45707a",
                                        text = "#654735",
                                        subtext1 = "#73503c",
                                        subtext0 = "#805942",
                                        overlay2 = "#8c6249",
                                        overlay1 = "#8c856d",
                                        overlay0 = "#a69d81",
                                        surface2 = "#bfb695",
                                        surface1 = "#d1c7a3",
                                        surface0 = "#e3dec3",
                                        base = "#f9f5d7",
                                        mantle = "#f0ebce",
                                        crust = "#e8e3c8",
                                },
                                mocha = {
                                        rosewater = "#ea6962",
                                        flamingo = "#ea6962",
                                        red = "#ea6962",
                                        maroon = "#ea6962",
                                        pink = "#d3869b",
                                        mauve = "#d3869b",
                                        peach = "#e78a4e",
                                        yellow = "#d8a657",
                                        green = "#a9b665",
                                        teal = "#89b482",
                                        sky = "#89b482",
                                        sapphire = "#89b482",
                                        blue = "#7daea3",
                                        lavender = "#7daea3",
                                        text = "#ebdbb2",
                                        subtext1 = "#d5c4a1",
                                        subtext0 = "#bdae93",
                                        overlay2 = "#a89984",
                                        overlay1 = "#928374",
                                        overlay0 = "#595959",
                                        surface2 = "#4d4d4d",
                                        surface1 = "#404040",
                                        surface0 = "#292929",
                                        base = "#1d2021",
                                        mantle = "#191b1c",
                                        crust = "#141617",
                                },
                        },
                        transparent_background = false,
                        show_end_of_buffer = false,
                        integration_default = false,
                        no_bold = true,
                        no_italic = false,
                        no_underline = true,
                        integrations = {
                                barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
                                cmp = true,
                                gitsigns = true,
                                hop = true,
                                illuminate = { enabled = true },
                                native_lsp = { enabled = true, inlay_hints = { background = true } },
                                neogit = true,
                                neotree = true,
                                semantic_tokens = true,
                                treesitter = true,
                                treesitter_context = true,
                                vimwiki = true,
                                which_key = true,
                                aerial = true,
                                fidget = true,
                                mason = true,
                                neotest = true,
                                dap_ui = true,
                                telescope = {
                                        enabled = true,
                                        style = "classic",
                                },
                        },
                        highlight_overrides = {
                                all = function(colors)
                                        return {
                                                CmpItemMenu = { fg = colors.surface2 },
                                                CursorLineNr = { fg = colors.text },
                                                FloatBorder = { bg = colors.base, fg = colors.subtext0 },
                                                GitSignsChange = { fg = colors.peach },
                                                LineNr = { fg = colors.overlay0 },
                                                LspInfoBorder = { link = "FloatBorder" },
                                                NeoTreeDirectoryIcon = { fg = colors.subtext1 },
                                                NeoTreeDirectoryName = { fg = colors.subtext1 },
                                                NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
                                                NeoTreeGitConflict = { fg = colors.red },
                                                NeoTreeGitDeleted = { fg = colors.red },
                                                NeoTreeGitIgnored = { fg = colors.overlay0 },
                                                NeoTreeGitModified = { fg = colors.peach },
                                                NeoTreeGitStaged = { fg = colors.green },
                                                NeoTreeGitUnstaged = { fg = colors.red },
                                                NeoTreeGitUntracked = { fg = colors.green },
                                                NeoTreeIndent = { fg = colors.surface1 },
                                                NeoTreeNormal = { bg = colors.mantle },
                                                NeoTreeNormalNC = { bg = colors.mantle },
                                                NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
                                                NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
                                                NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
                                                NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
                                                NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
                                                NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
                                                NormalFloat = { bg = colors.base },
                                                Pmenu = { bg = colors.mantle, fg = "" },
                                                PmenuSel = { bg = colors.surface0, fg = "" },
                                                VertSplit = { bg = colors.base, fg = colors.surface0 },
                                                WhichKeyFloat = { bg = colors.mantle },
                                                YankHighlight = { bg = colors.surface2 },
                                                FidgetTask = { fg = colors.subtext1 },
                                                FidgetTitle = { fg = colors.peach },

                                                IblIndent = { fg = colors.surface0 },
                                                IblScope = { fg = colors.overlay0 },

                                                Boolean = { fg = colors.mauve },
                                                Number = { fg = colors.mauve },
                                                Float = { fg = colors.mauve },

                                                PreProc = { fg = colors.mauve },
                                                PreCondit = { fg = colors.mauve },
                                                Include = { fg = colors.mauve },
                                                Define = { fg = colors.mauve },
                                                Conditional = { fg = colors.red },
                                                Repeat = { fg = colors.red },
                                                Keyword = { fg = colors.red },
                                                Typedef = { fg = colors.red },
                                                Exception = { fg = colors.red },
                                                Statement = { fg = colors.red },

                                                Error = { fg = colors.red },
                                                StorageClass = { fg = colors.peach },
                                                Tag = { fg = colors.peach },
                                                Label = { fg = colors.peach },
                                                Structure = { fg = colors.peach },
                                                Operator = { fg = colors.peach },
                                                Title = { fg = colors.peach },
                                                Special = { fg = colors.yellow },
                                                SpecialChar = { fg = colors.yellow },
                                                Type = { fg = colors.yellow, style = { "bold" } },
                                                Function = { fg = colors.green, style = { "bold" } },
                                                Delimiter = { fg = colors.subtext1 },
                                                Ignore = { fg = colors.subtext1 },
                                                Macro = { fg = colors.teal },

                                                TSAnnotation = { fg = colors.mauve },
                                                TSAttribute = { fg = colors.mauve },
                                                TSBoolean = { fg = colors.mauve },
                                                TSCharacter = { fg = colors.teal },
                                                TSCharacterSpecial = { link = "SpecialChar" },
                                                TSComment = { link = "Comment" },
                                                TSConditional = { fg = colors.red },
                                                TSConstBuiltin = { fg = colors.mauve },
                                                TSConstMacro = { fg = colors.mauve },
                                                TSConstant = { fg = colors.text },
                                                TSConstructor = { fg = colors.green },
                                                TSDebug = { link = "Debug" },
                                                TSDefine = { link = "Define" },
                                                TSEnvironment = { link = "Macro" },
                                                TSEnvironmentName = { link = "Type" },
                                                TSError = { link = "Error" },
                                                TSException = { fg = colors.red },
                                                TSField = { fg = colors.blue },
                                                TSFloat = { fg = colors.mauve },
                                                TSFuncBuiltin = { fg = colors.green },
                                                TSFuncMacro = { fg = colors.green },
                                                TSFunction = { fg = colors.green },
                                                TSFunctionCall = { fg = colors.green },
                                                TSInclude = { fg = colors.red },
                                                TSKeyword = { fg = colors.red },
                                                TSKeywordFunction = { fg = colors.red },
                                                TSKeywordOperator = { fg = colors.peach },
                                                TSKeywordReturn = { fg = colors.red },
                                                TSLabel = { fg = colors.peach },
                                                TSLiteral = { link = "String" },
                                                TSMath = { fg = colors.blue },
                                                TSMethod = { fg = colors.green },
                                                TSMethodCall = { fg = colors.green },
                                                TSNamespace = { fg = colors.yellow },
                                                TSNone = { fg = colors.text },
                                                TSNumber = { fg = colors.mauve },
                                                TSOperator = { fg = colors.peach },
                                                TSParameter = { fg = colors.text },
                                                TSParameterReference = { fg = colors.text },
                                                TSPreProc = { link = "PreProc" },
                                                TSProperty = { fg = colors.blue },
                                                TSPunctBracket = { fg = colors.text },
                                                TSPunctDelimiter = { link = "Delimiter" },
                                                TSPunctSpecial = { fg = colors.blue },
                                                TSRepeat = { fg = colors.red },
                                                TSStorageClass = { fg = colors.peach },
                                                TSStorageClassLifetime = { fg = colors.peach },
                                                TSStrike = { fg = colors.subtext1 },
                                                TSString = { fg = colors.teal },
                                                TSStringEscape = { fg = colors.green },
                                                TSStringRegex = { fg = colors.green },
                                                TSStringSpecial = { link = "SpecialChar" },
                                                TSSymbol = { fg = colors.text },
                                                TSTag = { fg = colors.peach },
                                                TSTagAttribute = { fg = colors.green },
                                                TSTagDelimiter = { fg = colors.green },
                                                TSText = { fg = colors.green },
                                                TSTextReference = { link = "Constant" },
                                                TSTitle = { link = "Title" },
                                                TSTodo = { link = "Todo" },
                                                TSType = { fg = colors.yellow, style = { "bold" } },
                                                TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
                                                TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
                                                TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
                                                TSURI = { fg = colors.blue },
                                                TSVariable = { fg = colors.text },
                                                TSVariableBuiltin = { fg = colors.mauve },

                                                ["@annotation"] = { link = "TSAnnotation" },
                                                ["@attribute"] = { link = "TSAttribute" },
                                                ["@boolean"] = { link = "TSBoolean" },
                                                ["@character"] = { link = "TSCharacter" },
                                                ["@character.special"] = { link = "TSCharacterSpecial" },
                                                ["@comment"] = { link = "TSComment" },
                                                ["@conceal"] = { link = "Grey" },
                                                ["@conditional"] = { link = "TSConditional" },
                                                ["@constant"] = { link = "TSConstant" },
                                                ["@constant.builtin"] = { link = "TSConstBuiltin" },
                                                ["@constant.macro"] = { link = "TSConstMacro" },
                                                ["@constructor"] = { link = "TSConstructor" },
                                                ["@debug"] = { link = "TSDebug" },
                                                ["@define"] = { link = "TSDefine" },
                                                ["@error"] = { link = "TSError" },
                                                ["@exception"] = { link = "TSException" },
                                                ["@field"] = { link = "TSField" },
                                                ["@float"] = { link = "TSFloat" },
                                                ["@function"] = { link = "TSFunction" },
                                                ["@function.builtin"] = { link = "TSFuncBuiltin" },
                                                ["@function.call"] = { link = "TSFunctionCall" },
                                                ["@function.macro"] = { link = "TSFuncMacro" },
                                                ["@include"] = { link = "TSInclude" },
                                                ["@keyword"] = { link = "TSKeyword" },
                                                ["@keyword.function"] = { link = "TSKeywordFunction" },
                                                ["@keyword.operator"] = { link = "TSKeywordOperator" },
                                                ["@keyword.return"] = { link = "TSKeywordReturn" },
                                                ["@label"] = { link = "TSLabel" },
                                                ["@math"] = { link = "TSMath" },
                                                ["@method"] = { link = "TSMethod" },
                                                ["@method.call"] = { link = "TSMethodCall" },
                                                ["@namespace"] = { link = "TSNamespace" },
                                                ["@none"] = { link = "TSNone" },
                                                ["@number"] = { link = "TSNumber" },
                                                ["@operator"] = { link = "TSOperator" },
                                                ["@parameter"] = { link = "TSParameter" },
                                                ["@parameter.reference"] = { link = "TSParameterReference" },
                                                ["@preproc"] = { link = "TSPreProc" },
                                                ["@property"] = { link = "TSProperty" },
                                                ["@punctuation.bracket"] = { link = "TSPunctBracket" },
                                                ["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
                                                ["@punctuation.special"] = { link = "TSPunctSpecial" },
                                                ["@repeat"] = { link = "TSRepeat" },
                                                ["@storageclass"] = { link = "TSStorageClass" },
                                                ["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
                                                ["@strike"] = { link = "TSStrike" },
                                                ["@string"] = { link = "TSString" },
                                                ["@string.escape"] = { link = "TSStringEscape" },
                                                ["@string.regex"] = { link = "TSStringRegex" },
                                                ["@string.special"] = { link = "TSStringSpecial" },
                                                ["@symbol"] = { link = "TSSymbol" },
                                                ["@tag"] = { link = "TSTag" },
                                                ["@tag.attribute"] = { link = "TSTagAttribute" },
                                                ["@tag.delimiter"] = { link = "TSTagDelimiter" },
                                                ["@text"] = { link = "TSText" },
                                                ["@text.danger"] = { link = "TSDanger" },
                                                ["@text.diff.add"] = { link = "diffAdded" },
                                                ["@text.diff.delete"] = { link = "diffRemoved" },
                                                ["@text.emphasis"] = { link = "TSEmphasis" },
                                                ["@text.environment"] = { link = "TSEnvironment" },
                                                ["@text.environment.name"] = { link = "TSEnvironmentName" },
                                                ["@text.literal"] = { link = "TSLiteral" },
                                                ["@text.math"] = { link = "TSMath" },
                                                ["@text.note"] = { link = "TSNote" },
                                                ["@text.reference"] = { link = "TSTextReference" },
                                                ["@text.strike"] = { link = "TSStrike" },
                                                ["@text.strong"] = { link = "TSStrong" },
                                                ["@text.title"] = { link = "TSTitle" },
                                                ["@text.todo"] = { link = "TSTodo" },
                                                ["@text.todo.checked"] = { link = "Green" },
                                                ["@text.todo.unchecked"] = { link = "Ignore" },
                                                ["@text.underline"] = { link = "TSUnderline" },
                                                ["@text.uri"] = { link = "TSURI" },
                                                ["@text.warning"] = { link = "TSWarning" },
                                                ["@todo"] = { link = "TSTodo" },
                                                ["@type"] = { link = "TSType" },
                                                ["@type.builtin"] = { link = "TSTypeBuiltin" },
                                                ["@type.definition"] = { link = "TSTypeDefinition" },
                                                ["@type.qualifier"] = { link = "TSTypeQualifier" },
                                                ["@uri"] = { link = "TSURI" },
                                                ["@variable"] = { link = "TSVariable" },
                                                ["@variable.builtin"] = { link = "TSVariableBuiltin" },

                                                ["@lsp.type.class"] = { link = "TSType" },
                                                ["@lsp.type.comment"] = { link = "TSComment" },
                                                ["@lsp.type.decorator"] = { link = "TSFunction" },
                                                ["@lsp.type.enum"] = { link = "TSType" },
                                                ["@lsp.type.enumMember"] = { link = "TSProperty" },
                                                ["@lsp.type.events"] = { link = "TSLabel" },
                                                ["@lsp.type.function"] = { link = "TSFunction" },
                                                ["@lsp.type.interface"] = { link = "TSType" },
                                                ["@lsp.type.keyword"] = { link = "TSKeyword" },
                                                ["@lsp.type.macro"] = { link = "TSConstMacro" },
                                                ["@lsp.type.method"] = { link = "TSMethod" },
                                                ["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
                                                ["@lsp.type.namespace"] = { link = "TSNamespace" },
                                                ["@lsp.type.number"] = { link = "TSNumber" },
                                                ["@lsp.type.operator"] = { link = "TSOperator" },
                                                ["@lsp.type.parameter"] = { link = "TSParameter" },
                                                ["@lsp.type.property"] = { link = "TSProperty" },
                                                ["@lsp.type.regexp"] = { link = "TSStringRegex" },
                                                ["@lsp.type.string"] = { link = "TSString" },
                                                ["@lsp.type.struct"] = { link = "TSType" },
                                                ["@lsp.type.type"] = { link = "TSType" },
                                                ["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
                                                ["@lsp.type.variable"] = { link = "TSVariable" },
                                        }
                                end,
                                latte = function(colors)
                                        return {
                                                IblIndent = { fg = colors.mantle },
                                                IblScope = { fg = colors.surface1 },

                                                LineNr = { fg = colors.surface1 },
                                        }
                                end,
                        },
                })
                vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "none", fg = "#eedaad" })
                vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = "#eedaad" })
                vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = "#eedaad" })

                vim.api.nvim_command("colorscheme catppuccin")
        end
end

local function minimal_catppuccin_config_function()
        return function()
                require("catppuccin").setup({
                        background = {
                                light = "latte",
                                dark = "mocha",
                        },
                        color_overrides = {
                                mocha = {
                                        text = "#e4e4e4",     -- Bright white for text and functions
                                        base = "#1e1e1e",     -- Dark grey-black background
                                        crust = "#151515",    -- Slightly darker base
                                        overlay0 = "#5a5a5a", -- Gray for comments
                                        yellow = "#d7ba7d",   -- Primary yellow for keywords
                                        gray = "#9ea3a5",     -- Light gray for less prominent elements
                                        green = "#8fcf3c",    -- Green for strings
                                        red = "#f7768e",      -- Soft red for errors and warnings
                                },
                        },
                        highlight_overrides = {
                                mocha = function(colors)
                                        return {
                                                Comment = { fg = colors.overlay0, style = { "italic" } },    -- Gray comments
                                                Keyword = { fg = colors.yellow, style = { "bold" } },        -- Keywords in yellow
                                                Type = { fg = colors.yellow, style = { "bold" } },           -- Structs and types in white
                                                Function = { fg = colors.text },                             -- Functions in bright white
                                                String = { fg = colors.green },                              -- Strings in green
                                                Variable = { fg = colors.text },                             -- Variables in bright white
                                                LineNr = { fg = colors.overlay0 },                           -- Line numbers in gray
                                                CursorLineNr = { fg = colors.yellow },                       -- Highlighted line number in yellow
                                                Pmenu = { bg = colors.base, fg = colors.text },              -- Popup menu with dark background
                                                PmenuSel = { bg = colors.overlay0, fg = colors.text },       -- Selected popup menu item
                                                Todo = { fg = colors.yellow, style = { "bold", "italic" } }, -- TODO comments in yellow
                                        }
                                end,
                        },
                })

                vim.api.nvim_command("colorscheme catppuccin")
        end
end

local function setup_noirbuddy_with_yellow()
        return function()
                require('noirbuddy').setup {
                        colors = {
                                primary = '#d7ba7d',    -- Primary yellow for keywords and highlights
                                secondary = '#9ea3a5',  -- Muted gray for secondary elements
                                background = '#1e1e1e', -- Dark gray-black background
                                foreground = '#e4e4e4', -- White for general text
                                comment = '#5a5a5a',    -- Gray for comments
                                accent = '#8fcf3c',     -- Green for strings
                                error = '#f7768e',      -- Soft red for errors
                        },
                        styles = {
                                comment = { italic = true }, -- Comments are italic
                                keyword = { bold = true },   -- Keywords are bold
                                function_name = {},          -- Functions use the foreground color
                                variable = {},               -- Variables use the foreground color
                                type = { bold = true },      -- Types are bold
                        },
                }

                -- vim.cmd.colorscheme("noirbuddy")
        end
end
local function gruber_catppuccin_setup()
        return function()
                require("catppuccin").setup({
                        background = {
                                light = "latte", -- Use "latte" for the light theme
                                dark = "mocha",  -- Use "mocha" for the dark theme
                        },
                        integrations = {
                                treesitter = true,
                                treesitter_context = true,
                        },
                        color_overrides = {
                                latte = {
                                        -- Light theme colors inspired by Gruber
                                        base = "#f4f4f4",     -- Background
                                        crust = "#e4e4e4",    -- Lighter background
                                        mantle = "#d4d4d4",   -- Even lighter background
                                        text = "#2c2c2c",     -- Main text
                                        overlay0 = "#757575", -- Comments and secondary text
                                        yellow = "#ffd75f",   -- Vibrant yellow for keywords
                                        green = "#86c37b",    -- Bright green for strings
                                        blue = "#6c8ed6",     -- Blue for function names
                                        red = "#ff5f5f",      -- Soft red for errors
                                },
                                mocha = {
                                        -- Dark theme colors inspired by Gruber
                                        base = "#1c1c1c",     -- Background
                                        crust = "#151515",    -- Darker background
                                        mantle = "#2c2c2c",   -- Slightly lighter background
                                        text = "#f4f4f4",     -- Main text
                                        overlay0 = "#737373", -- Comments and secondary text
                                        yellow = "#ffd75f",   -- Vibrant yellow for keywords
                                        green = "#86c37b",    -- Bright green for strings
                                        blue = "#6c8ed6",     -- Blue for function names
                                        red = "#ff5f5f",      -- Soft red for errors
                                },
                        },
                        highlight_overrides = {
                                all = function(colors)
                                        return {
                                                -- Override specific syntax groups
                                                Comment = { fg = colors.overlay0, style = { "italic" } }, -- Comments
                                                Keyword = { fg = colors.yellow, style = { "bold" } },     -- Keywords
                                                Function = { fg = colors.blue },                          -- Functions
                                                String = { fg = colors.green },                           -- Strings
                                                Type = { fg = colors.text, style = { "bold" } },          -- Types
                                                Error = { fg = colors.red },                              -- Errors
                                                Variable = { fg = colors.text },                          -- Variables
                                                CursorLineNr = { fg = colors.yellow },                    -- Line number highlight
                                        }
                                end,
                        },
                })
                -- Apply the Catppuccin colorscheme
                vim.cmd.colorscheme("catppuccin")
        end
end

local function cartppuccin_config_function()
        return function()
                require("catppuccin").setup({
                        background = {
                                light = "latte",
                                dark = "mocha",
                        },
                        color_overrides = {
                                latte = {
                                        -- Gruber-inspired light theme colors
                                        yellow = "#ffd75f",   -- Vibrant yellow for keywords
                                        green = "#73d216",    -- Bright green for strings
                                        blue = "#204a87",     -- Blue for functions
                                        text = "#2e3436",     -- Darker text
                                        overlay0 = "#888a85", -- Comments
                                        base = "#fcfcfc",     -- Background
                                        crust = "#d3d7cf",    -- Lighter elements
                                },
                                mocha = {
                                        -- Gruber-inspired dark theme colors
                                        yellow = "#ffd75f",   -- Vibrant yellow for keywords
                                        green = "#73d216",    -- Bright green for strings
                                        blue = "#204a87",     -- Blue for functions
                                        text = "#eeeeec",     -- Main text
                                        overlay0 = "#888a85", -- Comments
                                        base = "#1a1a1a",     -- Dark background
                                        crust = "#000000",    -- Darker background
                                },
                        },
                        highlight_overrides = {
                                all = function(colors)
                                        return {
                                                -- Core syntax groups
                                                Comment = { fg = colors.overlay0, style = { "italic" } },
                                                Keyword = { fg = colors.yellow, style = { "bold" } }, -- Keywords in yellow
                                                Function = { fg = colors.text },                      -- Functions
                                                String = { fg = colors.green },                       -- Strings
                                                Type = { fg = colors.text, style = { "bold" } },
                                                Variable = { fg = colors.text },
                                                TSConditional = { fg = colors.yellow },
                                                Conditional = { fg = colors.yellow },

                                                TSMethod = { fg = colors.text },
                                                TSFunction = { fg = colors.text },
                                                TSConstant = { fg = colors.yellow },
                                                Constant = { fg = colors.yellow },
                                                Enum = { fg = colors.yellow },

                                                -- Tree-Sitter groups
                                                ["@comment"] = { fg = colors.overlay0, style = { "italic" } },      -- TS Comment
                                                ["@conditional"] = { fg = colors.yellow, style = { "bold" } },      -- if, else
                                                ["@repeat"] = { fg = colors.yellow, style = { "bold" } },           -- for, while
                                                ["@keyword"] = { fg = colors.yellow, style = { "bold" } },          -- General keywords
                                                ["@keyword.function"] = { fg = colors.yellow, style = { "bold" } }, -- Function keywords
                                                ["@keyword.operator"] = { fg = colors.yellow, style = { "bold" } }, -- Operators like `and`, `or`
                                                ["@function"] = { fg = colors.blue },                               -- Function names
                                                ["@function.builtin"] = { fg = colors.blue },                       -- Built-in functions
                                                ["@method"] = { link = "TSMethod" },
                                                ["@lsp.type.method"] = { link = "TSMethod" },
                                                ["@lsp.type.functions"] = { link = "TSFunction" },
                                                ["@type"] = { fg = colors.text, style = { "bold" } },       -- Types
                                                ["@variable"] = { fg = colors.text },                       -- Variables
                                                ["@variable.builtin"] = { fg = colors.yellow },             -- Built-in variables
                                                ["@constant"] = { fg = colors.green },                      -- Constants
                                                ["@string"] = { fg = colors.green },                        -- Strings
                                                ["@string.escape"] = { fg = colors.yellow },                -- String escapes
                                                ["@number"] = { fg = colors.green },                        -- Numbers
                                                ["@boolean"] = { fg = colors.green },                       -- Booleans
                                                ["@tag"] = { fg = colors.yellow },                          -- Tags
                                                ["@tag.attribute"] = { fg = colors.green },                 -- Tag attributes
                                                ["@operator"] = { fg = colors.yellow, style = { "bold" } }, -- Operators
                                                ["@punctuation.delimiter"] = { fg = colors.overlay0 },      -- Punctuation
                                                ["@punctuation.bracket"] = { fg = colors.overlay0 },        -- Brackets
                                        }
                                end,
                        },
                })

                vim.api.nvim_command("colorscheme catppuccin")
        end
end


return {
        {
                'sainnhe/gruvbox-material',
                lazy = false,
                priority = 1000,
                config = function()
                        -- Optionally configure and load the colorscheme
                        -- directly inside the plugin declaration.
                        -- vim.g.gruvbox_material_enable_italic = true
                        vim.g.gruvbox_material_background = 'hard'
                        vim.cmd.colorscheme('gruvbox-material')
                end
        },

        {
                "Yazeed1s/minimal.nvim",
                enabled = false,
                priority = 10,
                config = function()
                        vim.cmd.colorscheme("minimal")
                end,
        },
        {
                "catppuccin/nvim",
                enabled = false,
                priority = 10,
                name = "catppuccin",
                -- config = gruvbox()
                -- config = gruber_catppuccin_setup()
                -- config = cartppuccin_config_function()
        },
        {
                "blazkowolf/gruber-darker.nvim",
                enabled = false,
                priority = 10,

                opts = {
                        bold = true,
                        invert = {
                                signs = false,
                                tabline = true,
                                visual = false,
                        },
                        italic = {
                                strings = true,
                                comments = true,
                                operators = false,
                                folds = true,
                        },
                        undercurl = true,
                        underline = true,

                },
                config = function()
                        vim.cmd.colorscheme("gruber-darker")
                end

        },
}
