-- Git related plugins
return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					add          = { text = '▐' },
					change       = { text = '▐' },
					delete       = { text = '▐' },
					topdelete    = { text = '▐' },
					changedelete = { text = '▐' },
					untracked    = { text = '▐' },
				},
				signcolumn     = true,  -- Toggle with `:Gitsigns toggle_signs`
				linehl         = false, -- Toggle with `:Gitsigns toggle_linehl`
				numhl          = false, -- Toggle with `:Gitsigns toggle_nunhl`
				word_diff      = false, -- Toggle with `:Gitsigns toggle_word_diff`
				sign_priority  = 9,
				watch_gitdir   = {
					interval     = 1000,
				},
				attach_to_untracked = false,
			})
	--		if pcall(require, "scrollbar") then
	--			require("scrollbar.handlers.gitsigns").setup()
	--		end
		end,
		opts = {},
	},
	{
		"akinsho/git-conflict.nvim",
		commit = "2957f74",
		config = function()
			require("git-conflict").setup({
				default_mappings = {
					ours = "co",
					theirs = "ct",
					none = "c0",
					both = "cb",
					next = "cn",
					prev = "cp",
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function ()
			local map = require("helpers.keys").map
			map("n", "<leader>ga", "<cmd>Git add %<cr>", "Stage the current file")
			map("n", "<leader>gb", "<cmd>Git blame<cr>", "Show the blame")
		end
	}
}
