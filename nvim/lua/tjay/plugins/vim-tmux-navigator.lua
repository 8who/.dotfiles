return {
  "christoomey/vim-tmux-navigator",
  lazy = false, -- Load the plugin on startup since it's essential for navigation
  config = function()
    -- Configure key bindings for seamless tmux and vim navigation
    vim.g.tmux_navigator_no_mappings = 1 -- Disable the default key mappings to customize
    vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
    vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
    vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
    vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
    vim.keymap.set("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", { silent = true })
  end,
}
