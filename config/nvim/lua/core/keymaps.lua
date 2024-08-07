local map = require("helpers.keys").map
local cmd = require("helpers.keys").cmd

-- Blazingly fast way out of insert mode
map("i", "jk", "<esc>")

-- Quick access to some common actions
map("n", "<leader>fw", "<cmd>w<cr>", "Write")
map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
map("n", "<leader>dw", "<cmd>close<cr>", "Window")

-- Diagnostic keymaps
map('n', 'gx', vim.diagnostic.open_float, "Show diagnostics under cursor")

-- Easier access to beginning and end of lines
map("n", "<M-h>", "^", "Go to beginning of line")
map("n", "<M-l>", "$", "Go to end of line")

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Deleting buffers
local buffers = require("helpers.buffers")
map("n", "<leader>db", buffers.delete_this, "Current buffer")
map("n", "<leader>do", buffers.delete_others, "Other buffers")
map("n", "<leader>da", buffers.delete_all, "All buffers")

-- Navigate buffers
map("n", "<c-n>", ":bn<cr>", "next buffer")
map("n", "<c-p>", ":bp<cr>", "prev buffer")
map("n", "<c-x>", ":bd<cr>", "exit buffer")

-- tabs
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>")
map("n", "<leader><tab>l", "<cmd>tablast<cr>")
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
map("n", "<leader><tab>]", "<cmd>tabnext<cr>")
map("n", "<leader><tab>d", "<cmd>tabclose<cr>")
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Switch between light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")

-- Clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- remove trailing white space
cmd("Nows", "%s/\\s\\+$//e", { desc = "remove trailing whitespace" })

-- remove blank lines
cmd("Nobl", "g/^\\s*$/d", { desc = "remove blank lines" })

-- spell check
cmd("Sp", "setlocal spell! spell?", { desc = "toggle spell check" })
map("n", "<leader>s", ":Sp<cr>", "toggle spell check")

-- vertical term
cmd("T", ":vs | :set nu! | :term", { desc = "vertical terminal" })

-- move blocks
map("v", "J", ":m '>+1<CR>gv=gv", "move block up")
map("v", "K", ":m '<-2<CR>gv=gv", "move block down")

-- focus scrolling
map("n", "<C-d>", "<C-d>zz", "scroll down")
map("n", "<C-u>", "<C-u>zz", "scroll up")

-- focus highlight searches
map("n", "n", "nzzzv", "next match")
map("n", "N", "Nzzzv", "prev match")

