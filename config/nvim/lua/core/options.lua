-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Suppress lspconfig deprecation warnings globally
local original_notify = vim.notify
vim.notify = function(msg, ...)
	if type(msg) == "string" and string.match(msg, "deprecated.*lspconfig") then
		return
	end
	return original_notify(msg, ...)
end

local opts = {
	shiftwidth = 2,
	tabstop = 2,
	softtabstop = 2,
	autoindent = true,
	expandtab = false,
	wrap = false,
	termguicolors = true,
	number = true,
--	relativenumber = true,
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
