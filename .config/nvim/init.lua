require("tjay.core")
require("tjay.lazy")
vim.opt.modeline = false
vim.opt.modelines = 0
vim.opt.showmode = false
vim.o.termguicolors = true -- Ensure true colors for WezTerm compatibility

-- vim.api.nvim_set_hl(0, "@type", { italic = true })
-- vim.api.nvim_set_hl(0, "@type.builtin", { italic = true })
-- vim.api.nvim_set_hl(0, "@storageclass", { italic = true })
-- vim.api.nvim_set_hl(0, "@type.qualifier", { italic = true })

-- Function to enforce transparency and customize highlights
local function set_transparent_highlights()
    -- local soft_gray = "#a8a8a8" -- Softer gray for text
    -- local muted_gray = "#888888" -- Even more muted for less important text
    local transparent_groups = {
        -- Core UI elements
        { "Normal", { bg = "none" } },
        { "NormalFloat", { bg = "none" } },
        { "NormalNC", { bg = "none" } },
        { "SignColumn", { bg = "none" } },
        { "LineNr", { bg = "none" } },
        { "CursorLineNr", { bg = "none" } },
        { "MsgArea", { bg = "none" } },
        { "EndOfBuffer", { bg = "none" } },
        { "NonText", { bg = "none" } },
        { "StatusLine", { bg = "none" } },
        { "StatusLineNC", { bg = "none" } },
        { "VertSplit", { bg = "none" } },
        { "FloatBorder", { bg = "none", fg = "#D8DEE9" } }, -- Changed from white to softer color
        { "Pmenu", { bg = "none" } },
        { "PmenuSel", { bg = "none" } },
        { "PmenuSbar", { bg = "none" } },
        { "PmenuThumb", { bg = "#D8DEE9" } }, -- Changed from white

        -- Telescope-specific
        { "TelescopeNormal", { bg = "none" } },
        { "TelescopeBorder", { bg = "none", fg = "#D8DEE9" } }, -- Changed from white
        { "TelescopePromptNormal", { bg = "none" } },
        { "TelescopePromptBorder", { bg = "none", fg = "#D8DEE9" } },
        { "TelescopeResultsNormal", { bg = "none" } },
        { "TelescopeResultsBorder", { bg = "none", fg = "#D8DEE9" } },
        { "TelescopePreviewNormal", { bg = "none" } },
        { "TelescopePreviewBorder", { bg = "none", fg = "#D8DEE9" } },
        { "TelescopeSelection", { bg = "#2f2f2f", fg = "#D8DEE9" } }, -- Changed from white
        { "TelescopeSelectionCaret", { bg = "none" } },
        { "TelescopePromptTitle", { bg = "none", fg = "#D8DEE9" } },
        { "TelescopeResultsTitle", { bg = "none", fg = "#D8DEE9" } },
        { "TelescopePreviewTitle", { bg = "none", fg = "#D8DEE9" } },
        { "TelescopeMatching", { bg = "none" } },
        { "TelescopePromptPrefix", { bg = "none" } },

        -- Diagnostics
        { "DiagnosticError", { bg = "none" } },
        { "DiagnosticWarn", { bg = "none" } },
        { "DiagnosticInfo", { bg = "none" } },
        { "DiagnosticHint", { bg = "none" } },
        { "DiagnosticVirtualTextError", { bg = "none" } },
        { "DiagnosticVirtualTextWarn", { bg = "none" } },
        { "DiagnosticVirtualTextInfo", { bg = "none" } },
        { "DiagnosticVirtualTextHint", { bg = "none" } },
        { "DiagnosticFloatingError", { bg = "none" } },
        { "DiagnosticFloatingWarn", { bg = "none" } },
        { "DiagnosticFloatingInfo", { bg = "none" } },
        { "DiagnosticFloatingHint", { bg = "none" } },
        --
        -- LSP and completion
        { "LspFloatWinNormal", { bg = "none" } },
        { "LspFloatWinBorder", { bg = "none" } },
        { "LspCodeLens", { bg = "none" } },
        { "LspInfoBorder", { bg = "none" } },
        { "CmpItemMenu", { bg = "none" } },
        { "CmpItemAbbr", { bg = "none" } },
        { "CmpItemAbbrMatch", { bg = "none" } },

        -- Visual mode
        { "Visual", { bg = "#232528", fg = "#bebebe" } }, -- Soft gray for visual selection
        { "VisualNOS", { bg = "#232528", fg = "#bebebe" } }, -- Visual not-owned selection

        -- nvim-tree
        { "NvimTreeNormal", { bg = "none" } },
        { "NvimTreeFolderName", { bg = "none", fg = "#98c0d0" } }, -- Soft cyan for folder names
        { "NvimTreeOpenedFolderName", { bg = "none", fg = "#98c0d0" } },
        { "NvimTreeEmptyFolderName", { bg = "none", fg = "#98c0d0" } },
        { "NvimTreeGitDirty", { bg = "none", fg = "#EBCB8B" } }, -- Yellow for git dirty
        { "NvimTreeGitStaged", { bg = "none", fg = "#A3BE8C" } }, -- Green for git staged
        { "NvimTreeGitNew", { bg = "none", fg = "#A3BE8C" } },
        { "NvimTreeGitDeleted", { bg = "none", fg = "#BF616A" } }, -- Red for git deleted
        { "NvimTreeCursorLine", { bg = "none", fg = "#bebebe" } }, -- Changed from white
        --
        --         -- Trouble.nvim - All transparent backgrounds with soft gray text
        { "TroubleNormal", { bg = "none" } },
        { "TroubleNormalNC", { bg = "none" } },
        { "TroubleSignError", { bg = "none" } },
        { "TroubleSignWarning", { bg = "none" } },
        { "TroubleSignInformation", { bg = "none" } },
        { "TroubleSignHint", { bg = "none" } },
        { "TroubleSignOther", { bg = "none" } },
        { "TroubleText", { bg = "none", fg = soft_gray } }, -- Soft gray instead of bright white
        { "TroubleTextError", { bg = "none", fg = "#BF616A" } }, -- Error text (red)
        { "TroubleTextWarning", { bg = "none", fg = "#EBCB8B" } }, -- Warning text (yellow)
        { "TroubleTextInformation", { bg = "none", fg = "#5E81AC" } }, -- Info text (blue)
        { "TroubleTextHint", { bg = "none", fg = "#A3BE8C" } }, -- Hint text (green)
        { "TroubleFile", { bg = "none", fg = "#98c0d0" } }, -- File names (matching your folder color)
        { "TroubleSource", { bg = "none", fg = "#5E81AC" } }, -- Source information
        { "TroubleCode", { bg = "none", fg = soft_gray } }, -- Code snippets in soft gray
        { "TroubleCount", { bg = "none", fg = "#EBCB8B" } }, -- Error/warning counts
        { "TroubleLocation", { bg = "none", fg = muted_gray } }, -- Line/column numbers in muted gray
        { "TroublePreview", { bg = "none" } },
        { "TroublePreviewBorder", { bg = "none", fg = "#D8DEE9" } },
        { "TroubleIndent", { bg = "none", fg = "#4C566A" } }, -- Indent guides
        { "TroublePos", { bg = "none", fg = "#cf7593" } }, -- Current position
        { "TroubleFoldIcon", { bg = "none", fg = muted_gray } }, -- Fold icons in muted gray
        { "TroubleTitle", { bg = "none", fg = soft_gray } }, -- Title in soft gray
        { "TroubleIconDirectory", { bg = "none", fg = "#98c0d0" } }, -- Directory icons
        { "TroubleIconFile", { bg = "none", fg = soft_gray } }, -- File icons in soft gray
        { "TroubleIconFolderClosed", { bg = "none", fg = "#98c0d0" } }, -- Folder icons
        { "TroubleIconFolderOpen", { bg = "none", fg = "#98c0d0" } }, -- Open folder icons
        --
        -- Cursor line and selection in Trouble - this is likely the culprit!
        { "TroubleCursorLine", { bg = "none", fg = soft_gray } }, -- Current line in trouble
        { "TroubleSelection", { bg = "#2a2a2a", fg = soft_gray } }, -- Selected item
        { "TroubleCurrentLine", { bg = "none", fg = soft_gray } }, -- Current line

        -- Additional diagnostic-related groups that might be causing bright white
        { "DiagnosticDeprecated", { bg = "none", fg = muted_gray } },
        { "DiagnosticUnnecessary", { bg = "none", fg = muted_gray } },
        { "DiagnosticUnderlineError", { bg = "none", sp = "#BF616A" } },
        { "DiagnosticUnderlineWarn", { bg = "none", sp = "#EBCB8B" } },
        { "DiagnosticUnderlineInfo", { bg = "none", sp = "#5E81AC" } },
        { "DiagnosticUnderlineHint", { bg = "none", sp = "#A3BE8C" } },

        -- LSP-related groups that might affect diagnostics display
        { "LspDiagnosticsDefaultError", { bg = "none", fg = "#BF616A" } },
        { "LspDiagnosticsDefaultWarning", { bg = "none", fg = "#EBCB8B" } },
        { "LspDiagnosticsDefaultInformation", { bg = "none", fg = "#5E81AC" } },
        { "LspDiagnosticsDefaultHint", { bg = "none", fg = "#A3BE8C" } },

        -- Generic text groups that might be used in diagnostics
        { "ErrorMsg", { bg = "none", fg = "#BF616A" } },
        { "WarningMsg", { bg = "none", fg = "#EBCB8B" } },
        { "InfoMsg", { bg = "none", fg = "#5E81AC" } },
        { "HintMsg", { bg = "none", fg = "#A3BE8C" } },

        -- Quickfix and location list (often used by diagnostics)
        { "qfLineNr", { bg = "none", fg = muted_gray } },
        { "qfFileName", { bg = "none", fg = "#98c0d0" } },
        { "QuickFixLine", { bg = "none", fg = soft_gray } },
    }
    --
    for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group[1], group[2])
    end
end
--
-- -- Function to set specific overrides
-- local function set_color_overrides()
--     -- Rose Pine Dawn palette
--     local palette = {
--         base = "#faf4ed",
--         surface = "#fffaf3",
--         overlay = "#f2e9e1",
--         muted = "#9893a5",
--         subtle = "#797593",
--         text = "#464261",
--         love = "#b4637a",
--         gold = "#ea9d34",
--         rose = "#d7827e",
--         pine = "#286983",
--         foam = "#56949f",
--         iris = "#907aa9",
--         leaf = "#6d8f89",
--         highlight_low = "#f4ede8",
--         highlight_med = "#dfdad9",
--         highlight_high = "#cecacd",
--     }
--
--     local variable_color = "#ad494a" -- This should match the original color
--     local operator_color = "#f2e9e1"
--
--     -- Override specific treesitter groups while preserving the original color
--     vim.api.nvim_set_hl(0, "@type", { fg = palette.gold }) -- Type annotations and declarations
--     vim.api.nvim_set_hl(0, "@variable", { fg = variable_color }) -- Regular variables
--     vim.api.nvim_set_hl(0, "@variable.builtin", { fg = variable_color }) -- Built-in vars (like `vim`, `self`)
--     vim.api.nvim_set_hl(0, "@parameter", { fg = variable_color }) -- Function parameters
--     vim.api.nvim_set_hl(0, "@field", { fg = variable_color }) -- Object fields
--     --
--     -- -- Add other syntax groups that might be affected
--     vim.api.nvim_set_hl(0, "Identifier", { fg = variable_color })
--     vim.api.nvim_set_hl(0, "@operator", { fg = operator_color })
--     vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = operator_color })
--     vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = operator_color })
--     vim.api.nvim_set_hl(0, "@punctuation.special", { fg = operator_color })
-- end
--
-- Consolidated ColorScheme autocmd to avoid timing conflicts
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        -- Apply transparency first
        set_transparent_highlights()

        -- Then apply colorscheme-specific overrides
        -- if vim.g.colors_name == "base16-classic-dark" then
        --     set_color_overrides()
        -- end
    end,
})
--
-- -- Also trigger on LSP attach and syntax events to ensure consistency
vim.api.nvim_create_autocmd({ "LspAttach", "Syntax" }, {
    callback = function()
        -- if vim.g.colors_name == "base16-classic-dark" then
        --     vim.schedule(set_color_overrides)
        -- end
    end,
})
--
-- -- Apply transparency and overrides on startup
set_transparent_highlights()
-- if vim.g.colors_name == "base16-classic-dark" then
--     set_color_overrides()
-- end
