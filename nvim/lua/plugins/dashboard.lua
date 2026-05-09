return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = {
            "",
            " ⠀⠀⠀⠀⠀⠀⠀⠀⡀⡢⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢄⢮⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⠀⡠⡂⣊⠢⡑⡐⠄⠀⠀⠀⠀⠀⠀⢀⢔⡕⣕⢗⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⠢⠨⢢⠢⡃⡪⡐⡑⢄⠀⠀⠀⠀⢰⢱⡣⣫⢪⢮⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⡑⠅⢅⠣⡊⡢⡊⢌⠢⡂⡀⠀⠀⢐⢧⢳⢕⢧⢳⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⠪⡨⠢⠡⡑⠰⡘⡌⡪⡂⡆⠄⠀⢐⡕⣗⢕⡗⡵⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⠕⢌⠪⡨⢌⠀⠘⡰⡑⡌⡪⡊⣂⠀⡯⣪⡳⣹⡪⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⠕⡅⠕⢌⠢⠀⠀⠀⢕⢅⢇⢕⢒⢬⢺⢕⢽⢜⢮⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⢕⢘⠜⢌⠪⠀⠀⠀⠀⠪⡢⡣⡣⡣⡳⣹⢕⢯⡳⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⢕⢅⢣⢑⠕⠀⠀⠀⠀⠀⠘⢜⢌⢎⢞⢎⢯⡳⡝⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⢕⢌⠆⠁⠀⠀⠀⠀⠀⠀⠀⠈⢎⢎⣗⢽⠑⠉⠀⠀⠀⠀⠀⠀⠀",
            " ⠀⠀⠀⠀⠀⠕⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⠓⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "",
            "     NikiZip bloated config      ",
            "",
          },
          center = {
            { icon = "  ", desc = "Find file", key = "f", action = "Telescope find_files" },
            { icon = "  ", desc = "New file", key = "n", action = "ene" },
            { icon = "  ", desc = "Recent files", key = "r", action = "Telescope oldfiles" },
            { icon = "  ", desc = "Quit", key = "q", action = "qa" },
          },
          footer = { "⚙️  backend • dark • minimal" },
        },
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
