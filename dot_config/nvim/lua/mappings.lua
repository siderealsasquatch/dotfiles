local global = vim.g
--local map = vim.api.nvim_set_keymap

local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

-- Set leader key to <space>
global.mapleader = " "

-- Window splits
map("n", "sh", ":sp<CR>") -- horizontal
map("n", "sv", ":vsp<CR>") -- vertical

-- Switch between windows
map("n", "<C-H>", "<C-W>h")
map("n", "<C-J>", "<C-W>j")
map("n", "<C-K>", "<C-W>k")
map("n", "<C-L>", "<C-W>l")

-- Buffers
-- Use the bindings in bufferline for cycling through buffers.
-- map("n", "<leader>]", ":bnext<CR>")
-- map("n", "<leader>[", ":bprevious<CR>")
map("n", "<tab>", ":b#<CR>")
map("n", "<C-C><C-D>", ":bd<CR>")

-- Copying to system clipboard
map({ "n", "v" }, "<leader>y", '"+y')
map("n", "<leader>yy", '"+yy')

-- Pasting from system clipboard
map({ "n", "v" }, "<leader>p", '"+p')
