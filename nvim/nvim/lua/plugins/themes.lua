return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- vim.api.nvim_set_hl(0, "@tag", { fg = "#E06C75" })     -- Красные теги (например, div, span)
            -- vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = "#FFFFFF" }) -- Белые < и >
            -- vim.api.nvim_set_hl(0, "@text", { fg = "#FFFFFF" })
            -- vim.api.nvim_set_hl(0, "@text.title", { fg = "#FFFFFF" }) -- Белый заголовок (title, h1, h2 и т.д.)
            -- vim.api.nvim_set_hl(0, "@text.strong", { fg = "#FFFFFF" }) -- Белый жирный текст (<b>, <strong>)
            -- vim.api.nvim_set_hl(0, "@text.emphasis", { fg = "#FFFFFF" }) -- Белый курсив (<i>, <em>)kk
            require("tokyonight").setup({
                -- use the night style
                style = "night",
                -- disable italic for functions
                styles = {
                    functions = {},
                },
            })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false,   -- Force no bold
                no_underline = false, -- Force no underline
                styles = {         -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
                -- Custom Highlights --
                colors = {
                    white = "#ffffff",
                    red = "#E06C75",
                }, -- Override default colors
                highlights = {
                    ["@tag"] = { fg = "$red" },
                    ["@tag.delimiter"] = { fg = "$white" },
                    ["@tag.css"] = { fg = "$red" },
                    ["@tag.scss"] = { fg = "$red" },
                    ["@type.tag.css"] = { fg = "$red" },
                    ["@type.tag.scss"] = { fg = "$red" },
                    ["@property.id.css"] = { fg = "#61AFEE" },
                    ["@property.class.css"] = { fg = "#D19A66" },
                    ["@property"] = { fg = "#ffffff" },
                    ["@property.name"] = { fg = "#ffffff" },
                    ["@number"] = { fg = "#D19A66" },
                    ["@string"] = { fg = "$red" },
                    ["@string.plain.css"] = { fg = "#D19A66" },
                    ["@markup.heading.1.html"] = { fg = "$white" },
                    ["@markup.heading.2.html"] = { fg = "$white" },
                    ["@markup.heading.3.html"] = { fg = "$white" },
                    ["@markup.heading.4.html"] = { fg = "$white" },
                    ["@markup.heading.5.html"] = { fg = "$white" },
                    ["@markup.heading.6.html"] = { fg = "$white" },
                    ["@markup.heading.html"] = { fg = "$white" },
                    ["@string.html"] = { fg = "#95BF79" },
                    ["@string.javascript"] = { fg = "#95BF79" },
                    ["@variable.css"] = { fg = "#9966CC" },
                    ["@variable.builtin.javascript"] = { fg = "#E5C07B" },
                    ["jsonKeywor"] = { fg = "$red" },

                    ["@attribute.css"] = { fg = "#56B6C2", priority = 99 },

                    NeoTreeDirectoryName = { fg = "$white" },
                    NeoTreeFileName = { fg = "$white" },

                    -- NeoTreeGitAdded      = { fg = "#ffffff" },
                   -- NeoTreeGitDeleted    = { fg = "#ffffff" },
                    -- NeoTreeGitModified   = { fg = "#ffffff" },
                    -- NeoTreeGitConflict   = { fg = "#ffffff" },
                    -- NeoTreeGitUntracked  = { fg = "#ffffff" },
                    -- ["@"] = { fg = "#E06C75" },
                }, -- Override highlight groups
            })

            -- setup must be called before loading
            -- vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
        "navarasu/onedark.nvim",
        -- Lua
        config = function()
            require("onedark").setup({
                -- Main options --
                style = "dark",   -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                transparent = true, -- Show/hide background
                term_colors = true, -- Change terminal color as per the selected theme style
                ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
                cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

                -- toggle theme style ---
                toggle_style_key = nil,                                                  -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
                toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

                -- Change code style ---
                -- Options are italic, bold, underline, none
                -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
                code_style = {
                    comments = "italic",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none",
                },

                -- Lualine options --
                lualine = {
                    transparent = false, -- lualine center bar transparency
                },

                -- Custom Highlights --
                colors = {
                    white = "#ffffff",
                    red = "#E06C75",
                }, -- Override default colors
                highlights = {
                    ["@tag"] = { fg = "$red" },
                    ["@tag.delimiter"] = { fg = "$white" },
                    ["@tag.css"] = { fg = "$red" },
                    ["@type.tag.css"] = { fg = "$red" },
                    ["@property.id.css"] = { fg = "#61AFEE" },
                    ["@property.class.css"] = { fg = "#D19A66" },
                    ["@property"] = { fg = "#ffffff" },
                    ["@property.name"] = { fg = "#ffffff" },
                    ["@number"] = { fg = "#D19A66" },
                    ["@string"] = { fg = "$red" },
                    ["@string.plain.css"] = { fg = "#D19A66" },
                    ["@markup.heading.1.html"] = { fg = "$white" },
                    ["@markup.heading.2.html"] = { fg = "$white" },
                    ["@markup.heading.3.html"] = { fg = "$white" },
                    ["@markup.heading.4.html"] = { fg = "$white" },
                    ["@markup.heading.5.html"] = { fg = "$white" },
                    ["@markup.heading.6.html"] = { fg = "$white" },
                    ["@markup.heading.html"] = { fg = "$white" },
                    ["@string.html"] = { fg = "#95BF79" },
                    ["@string.javascript"] = { fg = "#95BF79" },
                    ["@variable.css"] = { fg = "#9966CC" },
                    ["@variable.builtin.javascript"] = { fg = "#E5C07B" },
                    ["jsonKeywor"] = { fg = "$red" },

                    ["@attribute.css"] = { fg = "#56B6C2", priority = 99 },

                    NeoTreeDirectoryName = { fg = "$white" },
                    NeoTreeFileName = { fg = "$white" },

                    -- NeoTreeGitAdded      = { fg = "#ffffff" },
                   -- NeoTreeGitDeleted    = { fg = "#ffffff" },
                    -- NeoTreeGitModified   = { fg = "#ffffff" },
                    -- NeoTreeGitConflict   = { fg = "#ffffff" },
                    -- NeoTreeGitUntracked  = { fg = "#ffffff" },
                    -- ["@"] = { fg = "#E06C75" },
                }, -- Override highlight groups

                -- Plugins Config --
                diagnostics = {
                    darker = true, -- darker colors for diagnostic
                    undercurl = true, -- use undercurl instead of underline for diagnostics
                    background = true, -- use background color for virtual text
                },
            })
        end,
    },
}
