-- ~/.config/nvim/lua/keymaps.lua
local map = vim.keymap.set

-- Лидер-клавиша: пробел
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Навигация по сплитам (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", { desc = "Левый сплит" })
map("n", "<C-j>", "<C-w>j", { desc = "Нижний сплит" })
map("n", "<C-k>", "<C-w>k", { desc = "Верхний сплит" })
map("n", "<C-l>", "<C-w>l", { desc = "Правый сплит" })

-- Создание сплитов
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Вертикальный сплит" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Горизонтальный сплит" })

-- Изменение размеров сплитов
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Увеличить высоту" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Уменьшить высоту" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Уменьшить ширину" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Увеличить ширину" })

-- Сохранение / выход
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Сохранить" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Закрыть окно" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Выйти из Neovim" })
map("n", "<leader>ww", "<cmd>w<cr>", { desc = "Сохранить" })

-- Снять подсветку поиска
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Снять подсветку" })

-- Классика: Y = до конца строки
map("n", "Y", "y$", { desc = "Yank до конца строки" })

-- Перенос строки (J всегда вставляет новый пробел)
map("n", "J", "mJ", { desc = "Перенос строки без прыжка курсора" })

-- Центрирование прокрутки
map("n", "<C-d>", "<C-d>zz", { desc = "Прокрутить вниз + центр" })
map("n", "<C-u>", "<C-u>zz", { desc = "Прокрутить вверх + центр" })