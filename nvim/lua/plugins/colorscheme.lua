-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  -- Catppuccin (дефолтная тема, активируется при старте)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          telescope = { enabled = true },
          which_key = true,
          neotree = { enabled = true },
          lualine = true,
          dashboard = true,
          mason = true,
          blink = false,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Koda (альтернатива, лениво — по команде :colorscheme koda)
  {
    "oskarnurm/koda.nvim",
    name = "koda",
    lazy = true,
  },

  -- Yorumi (тёмная, приглушённая)
  {
    "yorumicolors/yorumi.nvim",
    lazy = true,
    config = function()
      vim.cmd.colorscheme("yorumi")
    end,
  },
}