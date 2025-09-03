return {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
        opts = {
                focus = true,
                use_diagnostic_signs = true,
                auto_close = false,
                auto_open = false,
                auto_preview = false,
                auto_fold = false,
                signs = {
                        error = "",
                        warning = "",
                        hint = "",
                        information = "",
                },
        },
        modes = {
                diagnostics = {
                        mode = "diagnostics",
                        preview = {
                                type = "split",
                                relative = "win",
                                position = "right",
                                size = 0.3,
                        },
                },
        },
        cmd = "Trouble",
        keys = {
                { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
                {
                        "<leader>xd",
                        "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
                        desc = "Open trouble document diagnostics",
                },
                { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
                { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
                { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
        },
}
