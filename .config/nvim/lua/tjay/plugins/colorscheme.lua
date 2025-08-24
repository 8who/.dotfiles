-- ~/.config/nvim/lua/colorscheme.lua

-- function ColorMyPencils(color)
--     color = color or "rose-pine"
--     vim.cmd.colorscheme(color)
-- end
--
-- return {
--     {
--         "folke/tokyonight.nvim",
--         config = function()
--             require("tokyonight").setup({
--                 style = "storm",
--                 transparent = true,
--                 terminal_colors = true,
--                 styles = {
--                     comments = { italic = false },
--                     keywords = { italic = false },
--                     sidebars = "dark",
--                     floats = "dark",
--                 },
--             })
--         end,
--     },
--     {
--         "rose-pine/neovim",
--         name = "rose-pine",
--         config = function()
--             require("rose-pine").setup({ disable_background = true })
--
--             vim.cmd("colorscheme rose-pine")
--             ColorMyPencils()
--         end,
--     },
-- }

--
--
--
--
--
--
--
--

-- Function to set transparent backgrounds and remove all highlighting
-- function ColorMyPencils(color)
--     color = color or "rose-pine" -- Default colorscheme
--     local ok, _ = pcall(vim.cmd.colorscheme, color)
--     if not ok then
--         vim.notify("Colorscheme " .. color .. " not found, falling back to default", vim.log.levels.WARN)
--         vim.cmd.colorscheme("default")
--     end
--
--     -- Get default terminal foreground color (usually white/light gray)
--     local default_fg = "NONE" -- This will use terminal's default text color
--
--     -- Set main highlight groups explicitly
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = default_fg })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = default_fg })
--     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", fg = default_fg })
--     vim.api.nvim_set_hl(0, "Visual", { bg = "#052441" })
--     vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
--     vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
--     vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
--     vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
--     vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
--     vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
--     vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
--     vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
--     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
--     vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
--     vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#052441" })

-- Remove all syntax highlighting except strings and characters
-- local syntax_groups = {
--     "Comment",
--     "Constant",
--     "Number",
--     "Boolean",
--     "Float",
--     "Identifier",
--     "Function",
--     "Statement",
--     "Conditional",
--     "Repeat",
--     "Label",
--     "Operator",
--     "Keyword",
--     "Exception",
--     "PreProc",
--     "Include",
--     "Define",
--     "Macro",
--     "PreCondit",
--     "Type",
--     "StorageClass",
--     "Structure",
--     "Typedef",
--     "Special",
--     "SpecialChar",
--     "Tag",
--     "Delimiter",
--     "SpecialComment",
--     "Debug",
--     "Error",
--     "Todo",
--     "Title",
--     "Directory",
--     "ErrorMsg",
--     "WarningMsg",
--     "Question",
--     "MoreMsg",
--     "ModeMsg",
-- }
--
-- for _, group in ipairs(syntax_groups) do
--     vim.api.nvim_set_hl(0, group, { fg = default_fg, bg = "none" })
-- end
--
-- -- Keep all string-related elements green
-- vim.api.nvim_set_hl(0, "String", { fg = "#e69500", bg = "none", italic = true })
-- vim.api.nvim_set_hl(0, "Character", { fg = "#e69500", bg = "none", italic = true })
--
-- -- Keywords for highlight groups to make transparent and remove colors
-- local keywords = {
--     "Normal",
--     "Float",
--     "Border",
--     "Pmenu",
--     "NvimTree",
--     "Trouble",
--     "Fzf",
--     "Telescope",
--     "StatusLine",
--     "TabLine",
--     "Alpha",
--     "Lualine",
--     "DapUI",
--     "Dashboard",
--     "Treesitter",
--     "@",
--     "lsp",
-- }
--
-- -- Get all highlight names and neutralize matching groups
-- local highlight_names = vim.fn.getcompletion("", "highlight")
-- for _, name in ipairs(highlight_names) do
--     for _, keyword in ipairs(keywords) do
--         if string.find(name, keyword) then
--             vim.api.nvim_set_hl(0, name, { fg = default_fg, bg = "none" })
--             break
--         end
--     end
-- end
--
-- -- Specifically target Treesitter groups but keep strings green
-- local treesitter_groups = {
--     "@variable",
--     "@function",
--     "@keyword",
--     "@type",
--     "@constant",
--     "@comment",
--     "@operator",
--     "@punctuation",
--     "@property",
--     "@parameter",
--     "@field",
--     "@method",
--     "@constructor",
--     "@namespace",
--     "@label",
-- }
--
-- for _, group in ipairs(treesitter_groups) do
--     vim.api.nvim_set_hl(0, group, { fg = default_fg, bg = "none" })
-- end
--
-- -- Keep all Treesitter string-related elements green
-- vim.api.nvim_set_hl(0, "@string", { fg = "#e69500", bg = "none", italic = true })
-- vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#e69500", bg = "none", italic = true })
-- vim.api.nvim_set_hl(0, "@string.regex", { fg = "#e69500", bg = "none", italic = true })
-- vim.api.nvim_set_hl(0, "@string.escape", { fg = "#e69500", bg = "none", italic = true })
-- vim.api.nvim_set_hl(0, "@string.special", { fg = "#e69500", bg = "none", italic = true })
-- vim.api.nvim_set_hl(0, "@character", { fg = "#e69500", bg = "none", italic = true })
-- vim.api.nvim_set_hl(0, "@character.special", { fg = "#e69500", bg = "none", italic = true })
--
-- -- LSP semantic tokens
-- local lsp_groups = vim.fn.getcompletion("@lsp", "highlight")
-- for _, group in ipairs(lsp_groups) do
--     vim.api.nvim_set_hl(0, group, { fg = default_fg, bg = "none" })
-- end
-- end

-- Override any highlighting that gets applied after startup
-- vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
-- callback = function()
--     -- Force everything to use default terminal colors except strings
--     local default_fg = "NONE"
--
--     -- Override syntax highlighting but keep strings green
--     vim.api.nvim_set_hl(0, "Type", { fg = default_fg, bg = "none" })
--     vim.api.nvim_set_hl(0, "Function", { fg = default_fg, bg = "none" })
--     vim.api.nvim_set_hl(0, "Keyword", { fg = default_fg, bg = "none" })
--     vim.api.nvim_set_hl(0, "Comment", { fg = default_fg, bg = "none" })
--
--     -- Keep all string and character elements green
--     vim.api.nvim_set_hl(0, "String", { fg = "#e69500", bg = "none", italic = true })
--     vim.api.nvim_set_hl(0, "Character", { fg = "#e69500", bg = "none", italic = true })
--
--     -- Keep all Treesitter string-related elements green
--     vim.api.nvim_set_hl(0, "@string", { fg = "#e69500", bg = "none", italic = true })
--     vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#e69500", bg = "none", italic = true })
--     vim.api.nvim_set_hl(0, "@string.regex", { fg = "#e69500", bg = "none", italic = true })
--     vim.api.nvim_set_hl(0, "@string.escape", { fg = "#e69500", bg = "none", italic = true })
--     vim.api.nvim_set_hl(0, "@string.special", { fg = "#e69500", bg = "none", italic = true })
--     vim.api.nvim_set_hl(0, "@character", { fg = "#e69500", bg = "none", italic = true })
--     vim.api.nvim_set_hl(0, "@character.special", { fg = "#e69500", bg = "none", italic = true })
--
--     -- Override other Treesitter elements
--     vim.api.nvim_set_hl(0, "@type", { fg = default_fg, bg = "none" })
--     vim.api.nvim_set_hl(0, "@function", { fg = default_fg, bg = "none" })
--     vim.api.nvim_set_hl(0, "@keyword", { fg = default_fg, bg = "none" })
--     vim.api.nvim_set_hl(0, "@variable", { fg = default_fg, bg = "none" })
--
--     -- Override LSP semantic highlighting except strings
--     local lsp_groups = vim.fn.getcompletion("@lsp", "highlight")
--     for _, group in ipairs(lsp_groups) do
--         if not string.find(group, "string") then
--             vim.api.nvim_set_hl(0, group, { fg = default_fg, bg = "none" })
--         end
--     end
--
--     -- Ensure LSP string-related elements stay green
--     vim.api.nvim_set_hl(0, "@lsp.type.string", { fg = "#e69500", bg = "none", italic = true })
--     vim.api.nvim_set_hl(0, "@lsp.type.character", { fg = "#e69500", bg = "none", italic = true })
-- end,
-- })

-- function ColorMyPencils(color)
--     color = color or "rose-pine"
--     vim.cmd.colorscheme(color)
-- end

-- Plugin configuration
return {
    -- Just start with these three
    {
        "catppuccin/nvim",
        name = "catppuccin-frappe",
        -- lazy = false,
        priority = 1000,
    },
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {
            variant = "main",
            styles = { italic = true },
            --     palette = {
            --         -- dawn = {
            --         --     no_bg = "#faf4ed",
            --         --     cursor_bg = "#000000",
            --         --     cursor_fg = "#ffffff",
            --         -- },
            --         -- moon = {
            --         --     gold = "#f6d5a7",
            --         --     foam = "#a1d1da",
            --         --     iris = "#d9c7ef",
            --         --     rose = "#ebbcba",
            --         --     pine = "#437e91",
            --         --     no_bg = "#000000",
            --         --     cursor_bg = "#ffffff",
            --         --     cursor_fg = "#000000",
            --         -- },
            --     },
            highlight_groups = {
                Normal = { bg = "none" },
                -- Cursor = { bg = "cursor_bg", fg = "cursor_fg" },
                -- Directory = { fg = "foam", bold = false },
                -- StatusLine = { bg = "surface", fg = "subtle" },
                -- StatusLineTerm = { link = "StatusLine" },
                -- StatusLineNC = { link = "StatusLine" },
                -- --- gitsigns
                -- StatusLineGitSignsAdd = { bg = "surface", fg = "pine" },
                -- StatusLineGitSignsChange = { bg = "surface", fg = "gold" },
                -- StatusLineGitSignsDelete = { bg = "surface", fg = "rose" },
                -- --- diagnostics
                -- StatusLineDiagnosticSignError = { bg = "surface", fg = "love" },
                -- StatusLineDiagnosticSignWarn = { bg = "surface", fg = "gold" },
                -- StatusLineDiagnosticSignInfo = { bg = "surface", fg = "foam" },
                -- StatusLineDiagnosticSignHint = { bg = "surface", fg = "iris" },
                -- StatusLineDiagnosticSignOk = { bg = "surface", fg = "pine" },
            },
        },
    },
    {
        "thembones79/mine-pine",
        name = "mine-pine",
    },
    {
        "franbach/miramare",
        name = "miramare",
    },
    {
        "vague2k/vague.nvim",
        -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
        config = function()
            require("vague").setup({
                -- optional configuration here
            })
            vim.cmd("colorscheme vague")
        end,
    },
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        name = "zenburned",
        -- lazy = false,
        priority = 1000,
        config = function()
            require("vague").setup({
                -- optional configuration here
            })
        end,
        opts = {},
    },
    {
        "zaldih/themery.nvim",
        lazy = false,
        priority = 999,
        keys = {
            { "<leader>th", "<cmd>Themery<cr>", desc = "Theme Picker" },
        },
        opts = {
            themes = {
                { name = "Catppuccin", colorscheme = "catppuccin-frappe" },
                { name = "Tokyo Night", colorscheme = "tokyonight" },
                { name = "Rose Pine", colorscheme = "rose-pine" },
                { name = "Nightshade", colorscheme = "nightshade" },
                { name = "Vague", colorscheme = "vague" },
                { name = "Zenburned", colorscheme = "zenburned" },
                { name = "Mine-Pine", colorscheme = "mine-pine" },
                { name = "Miramare", colorscheme = "miramare" },
            },
            livePreview = true,
            loadOnStartup = true,
        },
    },
}
