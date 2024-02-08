return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register(
				{
					["<leader>"] = {
						b = { name = "Buffer" },
						f = { name = "File" },
						d = { name = "Delete/Close" },
						q = { name = "Quit" },
						s = { name = "Search" },
						l = { name = "LSP" },
						u = { name = "UI" },
						b = { name = "Debugging" },
						g = { name = "Git" },
						r = { name = "Refactor" },
						["<tab>"] = { name = "Tabs" },
					}
				}
			)
		end
	}
}
