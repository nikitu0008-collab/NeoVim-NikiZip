return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- для иконок (опционально)
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    -- Глобальные хоткеи для открытия/закрытия дерева
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })
    vim.keymap.set("n", "<leader>r", ":Neotree reveal<CR>", { desc = "Reveal file" })

    require("neo-tree").setup({
      -- Не загружать стандартные маппинги, чтобы использовать свои
      use_default_mappings = false,

      window = {
        position = "left",  -- дерево слева
        width = 35,
        mappings = {
          -- Навигация
          ["j"] = "move_cursor_down",
          ["k"] = "move_cursor_up",
          ["h"] = "close_node",   -- закрыть папку
          ["l"] = "open",         -- открыть папку или файл
          ["<cr>"] = "open",      -- альтернативный вариант открытия

          -- Работа с файлами
          ["a"] = "add",          -- создать файл/папку
          ["d"] = "delete",       -- удалить
          ["r"] = "rename",       -- переименовать
        },
      },

      -- Автоматически закрывать Neo-tree после открытия файла[reference:0]
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        }
      }
    })
  end,
}
