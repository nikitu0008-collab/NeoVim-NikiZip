return {
  "panghu-huang/theme-picker.nvim",
  lazy = false,
  opts = {
    themes = {
      { name = "Catppuccin (Mocha)", colorscheme = "catppuccin" },
      { name = "Catppuccin (Macchiato)", colorscheme = "catppuccin-macchiato" },
      { name = "Catppuccin (Frappe)", colorscheme = "catppuccin-frappe" },
      { name = "Catppuccin (Latte)", colorscheme = "catppuccin-latte" },
      -- Новые темы:
      { name = "Koda", colorscheme = "koda" },
      { name = "Yorumi", colorscheme = "yorumi" },
    },
    picker = {
      layout_config = {
        width = 0.4,
        height = 0.6,
      },
    },
  },
}
