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

require("options")
require("keymaps")

require("lazy").setup("plugins")
