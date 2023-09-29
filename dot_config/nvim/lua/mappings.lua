local global = vim.g
--local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

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
-- Use the keybinds defined for bufferline
-- map("n", "<leader>]", ":bnext<CR>")
-- map("n", "<leader>[", ":bprevious<CR>")
map("n", "<tab>", ":b#<CR>")
map("n", "<C-C><C-D>", ":bd<CR>")
