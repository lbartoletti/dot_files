return {
	-- LSP Configuration - Simple and stable
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			-- Suppress ALL notify messages during LSP setup
			local original_notify = vim.notify
			vim.notify = function() end

			-- Setup capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- LSP keymaps function
			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end

			-- Diagnostic config
			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
				},
			})

			-- C/C++ - clangd using direct vim.lsp.start
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "c", "cpp", "objc", "objcpp" },
				callback = function()
					vim.lsp.start({
						name = "clangd",
						cmd = { "/usr/local/llvm21/bin/clangd", "--background-index", "--clang-tidy" },
						root_dir = vim.fs.find({ "compile_commands.json", "compile_flags.txt", ".clangd", ".git" }, { upward = true })[1],
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
			})

			-- Python - pylsp
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "python",
				callback = function()
					vim.lsp.start({
						name = "pylsp",
						cmd = { "pylsp" },
						root_dir = vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, { upward = true })[1],
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							pylsp = {
								plugins = {
									flake8 = { enabled = true, maxLineLength = 88 },
									pycodestyle = { enabled = false },
									mccabe = { enabled = false },
									pyflakes = { enabled = false },
									autopep8 = { enabled = false },
								},
							},
						},
					})
				end,
			})

			-- Nim
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "nim",
				callback = function()
					vim.lsp.start({
						name = "nim_langserver",
						cmd = { "nim_langserver" },
						root_dir = vim.fs.find({ "*.nimble", ".git" }, { upward = true })[1],
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
			})

			-- Markdown
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.lsp.start({
						name = "marksman",
						cmd = { "marksman", "server" },
						root_dir = vim.fs.find({ ".marksman.toml", ".git" }, { upward = true })[1],
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
			})

			-- Restore notifications
			vim.notify = original_notify
		end,
	},

	-- Progress notifications
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		config = function()
			require("fidget").setup()
		end,
	},

	-- Highlight symbol under cursor
	{
		"RRethy/vim-illuminate",
		event = "LspAttach",
	},
}