-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  -- Catppuccin (уже был)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",   -- можно сменить на macchiato, frappe, latte
        transparent_background = false,
      })
      -- Если хотите, чтобы эта тема загружалась по умолчанию — раскомментируйте:
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Koda (новый, рабочий репозиторий)
  {
    "oskarnurm/koda.nvim",
    name = "koda",
    config = function()
      -- Никаких настроек не требуется, но можно задать опции, если они появятся
    end,
  },

  -- Yorumi (тёмная, приглушённая)
  {
    "yorumicolors/yorumi.nvim",
    config = function()
      require("yorumi").setup({
        -- Доступные стили: "dark" (по умолчанию), "darker" (ещё темнее), "light"
        style = "darker",   -- выберите "darker" для максимально тёмного фона
        -- Также можно настроить контраст и акценты, но для начала этого достаточно
      })
    end,
  },
}
