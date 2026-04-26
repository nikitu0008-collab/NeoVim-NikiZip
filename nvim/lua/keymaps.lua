-- ~/.config/nvim/lua/keymaps.lua
local map = vim.keymap.set

-- Устанавливаем лидер-клавишу на пробел
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Навигаци по сплитам (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", { desc = "Перейти в левый сплит" })
map("n", "<C-j>", "<C-w>j", { desc = "Перейти в нижний сплит" })
map("n", "<C-k>", "<C-w>k", { desc = "Перейти в верхний сплит" })
map("n", "<C-l>", "<C-w>l", { desc = "Перейти в правый сплит" })

-- Быстрое сохранение и выход
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Сохранить файл" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Закрыть окно" })
