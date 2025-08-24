-- return {
--     "neovim/nvim-lspconfig",
--     event = { "BufReadPre", "BufNewFile" },
--     dependencies = {
--         "hrsh7th/cmp-nvim-lsp",
--         "williamboman/mason-lspconfig.nvim",
--         { "antosha417/nvim-lsp-file-operations", config = true },
--         { "folke/neodev.nvim", opts = {} },
--     },
--     config = function()
--         -- import lspconfig plugin
--         local lspconfig = require("lspconfig")
--
--         -- import mason_lspconfig plugin
--         local mason_lspconfig = require("mason-lspconfig")
--
--         -- import cmp-nvim-lsp plugin
--         local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
--         local keymap = vim.keymap -- for conciseness
--
--         vim.diagnostic.config({
--             virtual_text = true, -- Disable inline messages
--             signs = true, -- Show icons in the sign column
--             underline = true, -- Underline problematic code
--             update_in_insert = false, -- Don't update diagnostics while typing
--             severity_sort = true, -- Sort diagnostics by severity
--         })
--
--         vim.api.nvim_create_autocmd("LspAttach", {
--             group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--             callback = function(ev)
--                 -- Buffer local mappings.
--                 -- See `:help vim.lsp.*` for documentation on any of the below functions
--                 local opts = { buffer = ev.buf, silent = true }
--
--                 -- set keybinds
--                 opts.desc = "Show LSP references"
--                 keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
--
--                 opts.desc = "Go to declaration"
--                 keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
--
--                 opts.desc = "Show LSP definitions"
--                 keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
--
--                 opts.desc = "Show LSP implementations"
--                 keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
--
--                 opts.desc = "Show LSP type definitions"
--                 keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
--
--                 opts.desc = "See available code actions"
--                 keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--                 opts.desc = "Smart rename"
--                 keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
--
--                 opts.desc = "Show buffer diagnostics"
--                 keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--
--                 opts.desc = "Show line diagnostics"
--                 keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--                 opts.desc = "Go to previous diagnostic"
--                 keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--                 opts.desc = "Go to next diagnostic"
--                 keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--                 opts.desc = "Restart LSP"
--                 keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
--             end,
--         })
--
--         -- used to enable autocompletion (assign to every lsp server config)
--         local capabilities = cmp_nvim_lsp.default_capabilities()
--
--         -- Change the Diagnostic symbols in the sign column (gutter)
--         -- (not in youtube nvim video)
--         -- Change the Diagnostic symbols in the sign column (gutter)
--         vim.diagnostic.config({
--             virtual_text = true,
--             signs = {
--                 text = {
--                     [vim.diagnostic.severity.ERROR] = " ",
--                     [vim.diagnostic.severity.WARN] = " ",
--                     [vim.diagnostic.severity.HINT] = "󰠠 ",
--                     [vim.diagnostic.severity.INFO] = " ",
--                 },
--             },
--             underline = true,
--             update_in_insert = false,
--             severity_sort = true,
--         })
--
--         mason_lspconfig.setup_handlers({
--             -- default handler for installed servers
--             function(server_name)
--                 lspconfig[server_name].setup({
--                     capabilities = capabilities,
--                 })
--             end,
--             ["pyright"] = function()
--                 -- configure pyright language server for Python
--                 lspconfig["pyright"].setup({
--                     capabilities = capabilities,
--                     settings = {
--                         python = {
--                             analysis = {
--                                 autoSearchPaths = true,
--                                 diagnosticMode = "workspace", -- Analyze the entire workspace
--                                 useLibraryCodeForTypes = true,
--                                 typeCheckingMode = "off", -- Can also be "basic" or "strict"
--                             },
--                         },
--                     },
--                 })
--             end,
--             ["svelte"] = function()
--                 -- configure svelte server
--                 lspconfig["svelte"].setup({
--                     capabilities = capabilities,
--                     on_attach = function(client, bufnr)
--                         vim.api.nvim_create_autocmd("BufWritePost", {
--                             pattern = { "*.js", "*.ts" },
--                             callback = function(ctx)
--                                 -- Here use ctx.match instead of ctx.file
--                                 client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
--                             end,
--                         })
--                     end,
--                 })
--             end,
--             ["graphql"] = function()
--                 -- configure graphql language server
--                 lspconfig["graphql"].setup({
--                     capabilities = capabilities,
--                     filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
--                 })
--             end,
--             ["emmet_ls"] = function()
--                 -- configure emmet language server
--                 lspconfig["emmet_ls"].setup({
--                     capabilities = capabilities,
--                     filetypes = {
--                         "html",
--                         "typescriptreact",
--                         "javascriptreact",
--                         "css",
--                         "sass",
--                         "scss",
--                         "less",
--                         "svelte",
--                     },
--                 })
--             end,
--             ["lua_ls"] = function()
--                 -- configure lua server (with special settings)
--                 lspconfig["lua_ls"].setup({
--                     capabilities = capabilities,
--                     settings = {
--                         Lua = {
--                             -- make the language server recognize "vim" global
--                             diagnostics = {
--                                 globals = { "vim" },
--                             },
--                             completion = {
--                                 callSnippet = "Replace",
--                             },
--                         },
--                     },
--                 })
--             end,
--             ["gopls"] = function()
--                 -- Configure gopls for Go
--                 lspconfig["gopls"].setup({
--                     capabilities = capabilities,
--                     settings = {
--                         gopls = {
--                             analyses = {
--                                 unusedparams = true, -- Enable analysis for unused function parameters
--                             },
--                             staticcheck = true, -- Enable static analysis checks
--                         },
--                     },
--                 })
--             end,
--             ["clangd"] = function()
--                 -- configure clangd for C/C++
--                 lspconfig["clangd"].setup({
--                     capabilities = capabilities, -- Use your existing capabilities (e.g., for autocompletion)
--                     settings = {
--                         clangd = {
--                             -- Enable some helpful features for C/C++ (e.g., diagnostics, autocomplete)
--                             semanticHighlighting = true, -- Enable semantic highlighting
--                             diagnostics = {
--                                 enable = true, -- Enable diagnostics
--                             },
--                             -- Additional configuration specific to clangd can go here
--                         },
--                     },
--                 })
--             end,
--         })
--     end,
-- }

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- Import plugins
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Enable autocompletion capabilities
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Configure diagnostics (consolidate into one call)
        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "󰠠",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        -- LSP attach keybindings
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                local keymap = vim.keymap

                -- Keybindings
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

                -- Embedded-specific keybindings
                -- opts.desc = "Show hover documentation"
                -- keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Show signature help"
                keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

                opts.desc = "Format buffer"
                keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)

                -- Embedded development shortcuts
                opts.desc = "Switch between header/source"
                keymap.set("n", "<leader>k", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
            end,
        })

        -- Configure mason-lspconfig
        mason_lspconfig.setup({
            ensure_installed = { "pyright", "svelte", "graphql", "emmet_ls", "lua_ls", "gopls", "clangd" },
            automatic_installation = true,
        })

        -- Configure LSP servers
        local servers = {
            pyright = {
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "off",
                        },
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
            gopls = {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
            },
            clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--suggest-missing-includes",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    "--cross-file-rename",
                    "--log=verbose",
                    "--pretty",
                    "--all-scopes-completion",
                    "--header-insertion-decorators",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
                settings = {
                    clangd = {
                        semanticHighlighting = true,
                        diagnostics = { enable = true },
                    },
                },
                -- Auto-detect embedded project structure
                root_dir = function(fname)
                    return lspconfig.util.root_pattern(
                        "compile_commands.json",
                        "compile_flags.txt",
                        ".clangd",
                        ".git",
                        "Makefile",
                        "CMakeLists.txt",
                        "*.ioc" -- STM32CubeMX project files
                    )(fname)
                end,
            },
        }

        -- Apply configurations to each server
        for server_name, config in pairs(servers) do
            lspconfig[server_name].setup(vim.tbl_deep_extend("force", { capabilities = capabilities }, config))
        end

        -- Auto-generate compile_commands.json for embedded projects
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "Makefile", "*.mk", "CMakeLists.txt", "*.ioc" },
            group = vim.api.nvim_create_augroup("EmbeddedCompileCommands", {}),
            callback = function()
                local makefile_exists = vim.fn.filereadable("Makefile") == 1
                local cmake_exists = vim.fn.filereadable("CMakeLists.txt") == 1
                local compile_commands_exists = vim.fn.filereadable("compile_commands.json") == 1

                if makefile_exists and not compile_commands_exists then
                    vim.notify("Generating compile_commands.json with bear...", vim.log.levels.INFO)
                    vim.fn.system("bear -- make clean && bear -- make -j$(nproc)")
                elseif cmake_exists and not compile_commands_exists then
                    vim.notify("Generating compile_commands.json with cmake...", vim.log.levels.INFO)
                    vim.fn.system("cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .")
                end
            end,
        })

        -- Embedded-specific file associations
        vim.api.nvim_create_autocmd("BufRead", {
            pattern = { "*.ld", "*.lds" },
            group = vim.api.nvim_create_augroup("EmbeddedFileTypes", {}),
            callback = function()
                vim.bo.filetype = "ld"
            end,
        })

        -- Custom build commands
        vim.api.nvim_create_user_command("EmbeddedBuild", function()
            vim.cmd("!make -j$(nproc)")
        end, { desc = "Build embedded project" })

        vim.api.nvim_create_user_command("EmbeddedClean", function()
            vim.cmd("!make clean")
        end, { desc = "Clean embedded project" })

        vim.api.nvim_create_user_command("EmbeddedFlash", function()
            vim.cmd("!make flash")
        end, { desc = "Flash embedded project" })

        -- Keybindings for embedded development
        vim.keymap.set("n", "<leader>eb", "<cmd>EmbeddedBuild<CR>", { desc = "Build embedded project" })
        vim.keymap.set("n", "<leader>ec", "<cmd>EmbeddedClean<CR>", { desc = "Clean embedded project" })
        vim.keymap.set("n", "<leader>ef", "<cmd>EmbeddedFlash<CR>", { desc = "Flash embedded project" })
    end,
}
