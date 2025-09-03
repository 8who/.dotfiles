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
