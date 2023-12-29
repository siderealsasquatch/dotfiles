-- Set leader key to <space>
local global = vim.g
global.mapleader = " "
global.maplocalleader = " "

-- Set global keybinds
local utils = require("utils")

-- Window splits
utils.map("n", "sh", ":sp<CR>") -- horizontal
utils.map("n", "sv", ":vsp<CR>") -- vertical

-- Switch between windows
utils.map("n", "<C-H>", "<C-W>h")
utils.map("n", "<C-J>", "<C-W>j")
utils.map("n", "<C-K>", "<C-W>k")
utils.map("n", "<C-L>", "<C-W>l")

-- Buffers
-- Use the keybinds defined for bufferline
-- utils.map("n", "<leader>]", ":bnext<CR>")
-- utils.map("n", "<leader>[", ":bprevious<CR>")
utils.map("n", "<tab>", ":b#<CR>")
utils.map("n", "<C-C><C-D>", ":bd<CR>")

-- Copying to system clipboard
utils.map({ "v", "n" }, "<leader>y", '"+y')
utils.map("n", "<leader>yy", '"+yy')

-- Pasting from system clipboard
utils.map({ "v", "n" }, "<leader>p", '"+p')
