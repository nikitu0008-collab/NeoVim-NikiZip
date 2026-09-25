return {
  {
    "p00f/clangd_extensions.nvim",
    config = function()
      require("clangd_extensions").setup({
        inlay_hints = {
          inline = vim.fn.has("nvim-0.10") == 1,
          show_parameter_hints = true,
          parameter_hints_prefix = "← ",
          other_hints_prefix = "→ ",
          only_current_line = false,
          highlight = "Comment",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp", -- для capabilities
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      end

      -- clangd
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--enable-config" },
        capabilities = capabilities,
        on_attach = on_attach,
        root_markers = { ".clangd", ".clang-format", ".clang-tidy", "compile_commands.json" },
      })

      -- csharp_ls
      vim.lsp.config("csharp_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "cs" },
        root_markers = { ".git", "*.sln", "*.csproj" },
      })

      vim.lsp.enable({ "clangd", "csharp_ls" })
    end,
  },
}