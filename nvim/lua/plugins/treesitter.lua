return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "c_sharp",
        "rust",
        "lua",
        "vim",
        "vimdoc",
        "json",
        "markdown",
        "python",
        "bash",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
}
