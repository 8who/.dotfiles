return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        -- Custom Lualine component to show attached language server
        local clients_lsp = function()
            local bufnr = vim.api.nvim_get_current_buf()

            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
                return ""
            end

            local c = {}
            for _, client in pairs(clients) do
                table.insert(c, client.name)
            end
            return " " .. table.concat(c, "|")
        end

        local colors = {
            black = "#141414", -- Slightly lighter than pure black (#000000) for contrast
            grey = "#131313", -- Matches gruvbox dark background for cohesion
            blue = "#3e8fb0", -- Rose Pine blue (clear and vibrant)
            cyan = "#9ccfd8", -- Rose Pine foam (soft cyan)
            white = "#e0def4", -- Rose Pine text (main foreground)
            red = "#eb6f92", -- Rose Pine love (soft red)
            violet = "#c4a7e7", -- Rose Pine iris (soft purple)
            yellow = "#f6c177", -- Rose Pine gold (warm yellow)
            beige = "#807060",
            orange = "#D7827E",
            brown = "#605040",
            fg = "#e0def4", -- Main text color (rose pine text)
            inactive_fg = "#908caa", -- Muted text for inactive (rose pine muted)
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = "#191724", fg = "#9ccfd8", gui = "bold" }, -- foam
                b = { bg = "#1f1d2a", fg = "#6e6a86" },
                c = { bg = "none", fg = "#6e6a86" },
            },
            insert = {
                a = { bg = "#191724", fg = "#31748f", gui = "bold" }, -- pine
                b = { bg = "#1f1d2a", fg = "#6e6a86" },
                c = { bg = "none", fg = "#6e6a86" },
            },
            visual = {
                a = { bg = "#191724", fg = "#c4a7e7", gui = "bold" }, -- iris
                b = { bg = "#1f1d2a", fg = "#6e6a86" },
                c = { bg = "none", fg = "#6e6a86" },
            },
            command = {
                a = { bg = "#191724", fg = "#ebbcba", gui = "bold" }, -- gold
                b = { bg = "#1f1d2a", fg = "#6e6a86" },
                c = { bg = "none", fg = "#6e6a86" },
            },
            replace = {
                a = { bg = "#191724", fg = "#eb6f92", gui = "bold" }, -- love
                b = { bg = "#1f1d2a", fg = "#6e6a86" },
                c = { bg = "none", fg = "#6e6a86" },
            },
            inactive = {
                a = { bg = "#191724", fg = "#6e6a86", gui = "bold" },
                b = { bg = "#1f1d2a", fg = "#6e6a86" },
                c = { bg = "none", fg = "#6e6a86" },
            },
        }

        -- local custom_catppuccin = require("lualine.themes.catppuccin")
        --
        -- -- Custom colours
        -- custom_catppuccin.normal.b.fg = "#bac2de"
        -- custom_catppuccin.insert.b.fg = "#bac2de"
        -- custom_catppuccin.visual.b.fg = "#bac2de"
        -- custom_catppuccin.replace.b.fg = "#bac2de"
        -- custom_catppuccin.command.b.fg = "#bac2de"
        -- custom_catppuccin.inactive.b.fg = "#bac2de"
        -- -- custom_catppuccin.normal.c.fg = "#6e738d"
        -- custom_catppuccin.normal.c.bg = "#393552"
        --
        --
        require("lualine").setup({
            options = {
                theme = my_lualine_theme,
                -- variant = "main",
                component_separators = "",
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "Outline" },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = " ", right = "" },
                        icon = "",
                    },
                },
                lualine_b = {
                    {
                        "filetype",
                        icon_only = true,
                        padding = { left = 1, right = 0 },
                    },
                    "filename",
                },
                lualine_c = {
                    {
                        "branch",
                        icon = "",
                    },
                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                        colored = false,
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        update_in_insert = true,
                    },
                },
                lualine_y = { clients_lsp },
                lualine_z = {
                    { "location", separator = { left = "", right = " " }, icon = "" },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            extensions = { "toggleterm", "trouble" },
        })
        -- vim.api.nvim_set_hl(0, "lualine_b_normal", { bg = "#191724" })
        -- vim.api.nvim_set_hl(0, "lualine_b_insert", { bg = "#191724" })
        -- vim.api.nvim_set_hl(0, "lualine_b_visual", { bg = "#191724" })
        -- vim.api.nvim_set_hl(0, "lualine_b_replace", { bg = "#191724" })
        -- vim.api.nvim_set_hl(0, "lualine_b_command", { bg = "#191724" })
        -- vim.api.nvim_set_hl(0, "lualine_b_inactive", { bg = "#191724" })
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
    end,
}
