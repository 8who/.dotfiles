vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true

-- Enable highlighting of special registers and embedded C keywords
vim.opt_local.syntax = "on"

-- Set compiler to make for embedded projects
vim.opt_local.makeprg = "make"

-- Configure tags for peripheral registers and HAL functions
vim.opt_local.tags:append("./tags,stm32.tags")

-- Enable ARM register highlighting
vim.cmd([[
  syntax keyword cRegister GPIOA GPIOB GPIOC GPIOD GPIOE GPIOF GPIOG GPIOH GPIOI
  syntax keyword cRegister RCC FLASH USART1 USART2 USART3 UART4 UART5
  syntax keyword cRegister SPI1 SPI2 SPI3 SPI4 SPI5 SPI6
  syntax keyword cRegister I2C1 I2C2 I2C3
  syntax keyword cRegister TIM1 TIM2 TIM3 TIM4 TIM5 TIM6 TIM7 TIM8 TIM9 TIM10 TIM11 TIM12 TIM13 TIM14
  syntax keyword cRegister ADC1 ADC2 ADC3 ADC_Common
  syntax keyword cRegister DAC DMA1 DMA2 EXTI SYSCFG IWDG WWDG
  syntax keyword cRegister CORTEX_M4
  hi def link cRegister Special
]])

-- Add microcontroller register completion
local cmp = require("cmp")
cmp.setup.filetype("c", {
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
})

-- Fast compile and flash keybindings
local keymap = vim.keymap.set
keymap("n", "<leader>mb", ":make<CR>", { noremap = true, silent = true, desc = "Build Project" })
keymap("n", "<leader>mc", ":make clean<CR>", { noremap = true, silent = true, desc = "Clean Build" })
keymap(
    "n",
    "<leader>mf",
    ":TermExec cmd='st-flash write build/your_program.bin 0x8000000'<CR>",
    { noremap = true, silent = true, desc = "Flash Firmware" }
)
keymap(
    "n",
    "<leader>ms",
    ":TermExec cmd='minicom -D /dev/ttyACM0 -b 115200'<CR>",
    { noremap = true, silent = true, desc = "Serial Monitor" }
)

-- DAP debugging keymaps
keymap(
    "n",
    "<leader>db",
    ":lua require'dap'.toggle_breakpoint()<CR>",
    { noremap = true, silent = true, desc = "Toggle Breakpoint" }
)
keymap("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true, desc = "Continue" })
keymap("n", "<leader>ds", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true, desc = "Step Over" })
keymap("n", "<leader>di", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true, desc = "Step Into" })
keymap("n", "<leader>do", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true, desc = "Step Out" })
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true, desc = "Open REPL" })
keymap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", { noremap = true, silent = true, desc = "Run Last" })
keymap("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", { noremap = true, silent = true, desc = "Toggle UI" })
keymap("n", "<leader>dt", ":lua require'dap'.terminate()<CR>", { noremap = true, silent = true, desc = "Terminate" })
