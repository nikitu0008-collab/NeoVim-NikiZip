-- ~/.config/nvim/lua/options.lua
local opt = vim.opt

opt.number = true          -- Включить относительную нумерацию
opt.relativenumber = true
opt.tabstop = 4            -- Размер табуляции в пробелах
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true       -- Превращать табы в пробелы
opt.autoindent = true
opt.smartindent = true
opt.wrap = false           -- Отключаем перенос строк
opt.termguicolors = true   -- Включаем 24-битные цвета для темы

-- НАСТРОЙКА ОТОБРАЖЕНИЯ ОШИБОК И ПРЕДУПРЕЖДЕНИЙ (diagnostics)
vim.diagnostic.config({
  virtual_text = true,      -- Текст ошибки в конце строки (рядом с кодом)
  signs = true,             -- Значки на полях (например, >>)
  underline = true,         -- Подчёркивание ошибочного кода
  update_in_insert = false, -- Не обновлять диагностику во время ввода
  severity_sort = true,     -- Сначала показывать ошибки, потом предупреждения
  float = {
    border = "rounded",     -- Красивая рамка у всплывающего окна
    source = true,          -- Показывать источник (clangd)
  },
})
