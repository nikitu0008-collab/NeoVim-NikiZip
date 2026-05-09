-- ~/.config/nvim/init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
function custom_winbar()
    -- Получаем иконку для текущего типа файла
    local icon = require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"), vim.fn.expand("%:e"), { default = "?" })
    -- Получаем имя файла
    local filename = vim.fn.expand("%:t")
    -- Если файл не сохранен, показываем [No Name]
    if filename == "" then
        filename = "[No Name]"
    end
    -- Собираем строку: иконка + имя файла
    return string.format("%s %s", icon or "?", filename)
end
-- Включаем winbar для всех окон
vim.opt.winbar = "%{%v:lua.custom_winbar()%}"

vim.opt.rtp:prepend(lazypath)

vim.env.PATH = vim.env.PATH .. ':' .. vim.fn.expand('~/.dotnet/tools')

-- Настройка таймаута для различения одиночного и двойного нажатия (опционально)
vim.o.timeout = true          -- Включить таймаут для последовательностей клавиш
vim.o.timeoutlen = 500        -- Максимальное время между нажатиями (мс)

-- 1. Двойной Enter: разбить строку в позиции курсора (перенос остатка на новую строку)
vim.keymap.set('n', '<CR><CR>', 'i<CR><Esc>', { desc = 'Split line at cursor' })

-- 2. Двойной Backspace: удалить символ слева от курсора (как Backspace в режиме вставки)
vim.keymap.set('n', '<BS><BS>', 'X', { desc = 'Delete character before cursor' })

-- optimization moved j, k 

-- Ускорение отрисовки (меньше лагов при быстрой прокрутке)
vim.opt.lazyredraw = true

-- Уменьшить время ожидания key-mapped sequences
vim.opt.timeoutlen = 300

-- Синхронизация синтаксиса с minlines для больших файлов
vim.opt.synmaxcol = 128

-- Оставить курсор по центру экрана при прокрутке
vim.opt.scrolloff = 8

require("options")
require("keymaps")

require("lazy").setup("plugins")
