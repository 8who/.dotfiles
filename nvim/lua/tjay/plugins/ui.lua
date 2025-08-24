return {
    -- Improve vim.ui interfaces
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {
            input = {
                border = "rounded",
                relative = "cursor",
                prefer_width = 40,
                win_options = {
                    winblend = 10,
                },
            },
            select = {
                enabled = true,
                backend = { "telescope", "builtin" },
                telescope = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        width = 0.8,
                        height = 0.6,
                    },
                },
                builtin = {
                    border = "rounded",
                    relative = "editor",
                    win_options = {
                        winblend = 10,
                        cursorline = true,
                    },
                },
            },
        },
    },
}
