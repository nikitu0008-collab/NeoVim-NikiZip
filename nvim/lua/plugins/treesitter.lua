return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc" },
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },
}
