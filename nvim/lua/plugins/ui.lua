return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        telescope = { enabled = true },
        which_key = true,
        native_lsp = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        globalstatus = true,
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",
      delay = 300,
      spec = {
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>m", group = "cmake" },
        { "<leader>t", group = "terminal" },
        { "<leader>x", group = "diagnostics" },
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "doom",
      config = {
        header = {
          "",
          "   _   _ _ _    _ ______ _       ",
          "  | \\ | (_) | _(_)___  (_) |_ __ ",
          "  |  \\| | | |/ / |  / /| | | '_ \\",
          "  | |\\  | |   <| | / / | | | |_) |",
          "  |_| \\_|_|_|\\_\\_|/_/  |_|_| .__/",
          "                           |_|    ",
          "",
          "       NeoVim-NikiZip",
          "   C++ • Rust • C# • Backend",
          "",
        },
        center = {
          { icon = "  ", desc = "Find file", key = "f", action = "Telescope find_files" },
          { icon = "  ", desc = "New file", key = "n", action = "ene" },
          { icon = "  ", desc = "Recent files", key = "r", action = "Telescope oldfiles" },
          { icon = "  ", desc = "Quit", key = "q", action = "qa" },
        },
      },
    },
  },
}
