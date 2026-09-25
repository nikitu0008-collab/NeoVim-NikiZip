return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",
      delay = 300,
      spec = {
        { "<leader>f", group = "file" },
        { "<leader>g", group = "git" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
