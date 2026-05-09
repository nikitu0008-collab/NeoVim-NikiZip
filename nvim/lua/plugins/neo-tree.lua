return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          use_web_devicons = true,
        },
        mappings = {
          ["<cr>"] = "open_tabnew",
          ["v"] = "open_vertical",
          ["h"] = "open_horizontal",
        },
      })
    end,
  },
}
