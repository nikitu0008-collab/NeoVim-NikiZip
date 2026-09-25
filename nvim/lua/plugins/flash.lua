return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter" },
      { "gs", mode = { "n", "x" }, function() require("flash").toggle() end, desc = "Toggle Flash search" },
    },
    opts = {
      label = { uppercase = false },
      jump = { autojump = true },
      highlight = { backdrop = true },
    },
  },
}