return {
	-- Modern formatting with conform.nvim
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black", "isort" },
					c = { "clang_format" },
					cpp = { "clang_format" },
					nim = { "nimpretty" },
					markdown = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters = {
					clang_format = {
						command = "/usr/local/llvm21/bin/clang-format",
					},
				},
			})

			-- Format command
			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, range = range })
			end, { range = true })

			-- Format keymap
			vim.keymap.set({ "n", "v" }, "<leader>cf", function()
				require("conform").format({ async = true })
			end, { desc = "Format code" })
		end,
	},

	-- Linting with nvim-lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				python = { "flake8" },
				c = { "cppcheck" },
				cpp = { "cppcheck" },
			}

			-- Auto-lint on save and text change
			vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}