-- ~/.config/nvim/lua/plugins/base16.lua
return {
    "RRethy/nvim-base16",
    lazy = false, -- Load during startup since it's a colorscheme
    priority = 1000, -- High priority ensures it loads early
}
