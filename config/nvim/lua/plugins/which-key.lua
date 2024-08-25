return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<leader><tab>", group = "Tabs" },
					{ "<leader>b", group = "Debugging" },
					{ "<leader>d", group = "Delete/Close" },
					{ "<leader>f", group = "File" },
					{ "<leader>g", group = "Git" },
					{ "<leader>l", group = "LSP" },
					{ "<leader>q", group = "Quit" },
					{ "<leader>r", group = "Refactor" },
					{ "<leader>s", group = "Search" },
					{ "<leader>u", group = "UI" },
				}
			)
		end
	}
}
