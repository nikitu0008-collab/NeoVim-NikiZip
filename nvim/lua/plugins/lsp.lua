return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"clang-tidy",
				"csharp-language-server",
				"rust-analyzer",
				"codelldb",
				"stylua",
			},
			auto_update = false,
			run_on_start = true,
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"clangd",
				"csharp_ls",
			},
			automatic_installation = true,
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"p00f/clangd_extensions.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("n", "gd", vim.lsp.buf.definition, "Go to definition")
				map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				map("n", "gr", vim.lsp.buf.references, "References")
				map("n", "K", vim.lsp.buf.hover, "Hover documentation")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
				map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
				map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
				map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
			end

			vim.lsp.config("clangd", {
				cmd = { "clangd", "--enable-config" },
				capabilities = capabilities,
				on_attach = on_attach,
				root_markers = {
					".clangd",
					".clang-format",
					".clang-tidy",
					"compile_commands.json",
					"CMakeLists.txt",
					".git",
				},
			})

			vim.lsp.config("csharp_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "cs" },
				root_markers = { ".sln", ".csproj", ".git" },
			})

			vim.lsp.enable({ "clangd", "csharp_ls" })

			require("clangd_extensions").setup({
				inlay_hints = {
					inline = true,
					show_parameter_hints = true,
					parameter_hints_prefix = "← ",
					other_hints_prefix = "→ ",
				},
			})
		end,
	},
}
