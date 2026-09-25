-- ~/.config/nvim/lua/options.lua
local opt = vim.opt

-- Нумерация строк
opt.number = true
opt.relativenumber = true

-- Отступы (4 пробела)
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Переносы, скролл
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Шрифт (для GUI-клиентов: neovide, nvim-qt и т.п.)
opt.guifont = "JetBrainsMono Nerd Font Mono:h13:w500"

-- Цвета и внешний вид
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }
opt.list = true
opt.listchars = { tab = "» ", trail = "·" }

-- Поиск
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Разделение окон
opt.splitright = true
opt.splitbelow = true

-- Удобство
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.lazyredraw = true
opt.synmaxcol = 128

-- Диагностика
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})