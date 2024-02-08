
-- Handle plugins with lazy.nvim
if vim.g.noplugins == nil then
	require("core.lazy")
else
--	local colors = vim.fn.stdpath("data") .. "/lazy/miasma.nvim/colors/miasma.vim"
--	if vim.fn.filereadable(colors) then vim.cmd('source ' .. colors) end
end
-- General Neovim keymaps
require("core.keymaps")

-- Other options
require("core.options")
