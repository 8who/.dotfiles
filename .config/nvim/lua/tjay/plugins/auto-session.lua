return {
    "rmagatti/auto-session",
    -- "cameronr/auto-session",
    -- branch = "fix/windows-fzf-terminal",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            -- Core settings
            auto_restore_enabled = false,
            auto_session_suppress_dirs = {
                "~/",
                "~/Dev/",
                "~/Downloads",
                "~/Documents",
                "~/Desktop/",
            },

            -- Additional settings to prevent issues
            log_level = "error",
            auto_session_enable_last_session = false,
            auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
            auto_session_enabled = true,
            auto_save_enabled = nil,
            auto_session_use_git_branch = nil,
            bypass_session_save_file_types = nil,

            -- Session lens integration (if you use telescope)
            session_lens = {
                -- Set to false if you don't want session lens
                buftypes_to_ignore = {},
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
            },
        })

        -- Keymaps
        local keymap = vim.keymap

        -- Restore session for current directory
        keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", {
            desc = "Restore session for cwd",
        })

        -- Save session for current directory
        keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", {
            desc = "Save session for auto session root dir",
        })

        -- -- Additional useful keymaps (optional)
        -- keymap.set("n", "<leader>wd", "<cmd>AutoSession delete<CR>", {
        --     desc = "Delete session for current directory",
        -- })
        --
        -- keymap.set("n", "<leader>wf", "<cmd>AutoSession search<CR>", {
        --     desc = "Search sessions",
        -- })
    end,
}
