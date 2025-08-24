return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                borders = true,
                sorting_strategy = "descending",
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
                winblend = 0,
                prompt_prefix = "> ",
                selection_caret = "> ",
                layout_config = {
                    prompt_position = "bottom",
                },
            },
            -- pickers = {
            --     colorscheme = {
            --         enable_preview = true,
            --     },
            -- },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        -- keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme with preview" })

        -- -- colorscheme persistence
        -- local scheme_file = vim.fn.stdpath("config") .. "/colorscheme.txt"
        -- local f = io.open(scheme_file, "r")
        -- if f then
        --     local name = f:read("*l")
        --     f:close()
        --     if name and name ~= "" then
        --         pcall(vim.cmd.colorscheme, name)
        --     end
        -- end
        --
        -- vim.api.nvim_create_autocmd("ColorScheme", {
        --     callback = function()
        --         local f = io.open(scheme_file, "w")
        --         if f then
        --             f:write(vim.g.colors_name or "")
        --             f:close()
        --         end
        --     end,
        -- })
    end,
}
