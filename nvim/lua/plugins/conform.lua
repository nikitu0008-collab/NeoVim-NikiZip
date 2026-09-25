return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo", "FormatToggle" },
    keys = {
      { "<leader>F", function() require("conform").format({ lsp_fallback = true }) end, desc = "Форматировать буфер" },
    },
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        rust = { "rustfmt" },
        lua = { "stylua" },
        python = { "black" },
        go = { "gofmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        zsh = { "shfmt" },
      },
      formatters = {
        clang_format = { args = { "-style=file", "-i" } },
      },
      format_on_save = { timeout_ms = 1000, lsp_fallback = true },
    },
  },
}