return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				desc = "Format buffer",
			},
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
			},
			formatters = {
				clang_format = {
					args = { "-style=file", "-i" },
				},
			},
			format_on_save = {
				timeout_ms = 1500,
				lsp_format = "fallback",
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufWritePost", "InsertLeave" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				cpp = { "clangtidy" },
				c = { "clangtidy" },
				python = { "ruff" },
			}

			local group = vim.api.nvim_create_augroup("NikiZipLint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = group,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
