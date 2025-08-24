return {
    "vyfor/cord.nvim",
    build = ":Cord update", -- Fetches the server executable
    opts = {
        -- Customize as needed (see below)
        display = {
            show_file = true, -- Show file being edited (e.g., main.c)
            show_project = true, -- Show project name (from git or directory)
            show_language_icon = true, -- Show C icon for .c/.h files
        },
        idle = {
            enable = true, -- Show idle status when not editing
            text = "Idle in Neovim",
        },
    },
}
