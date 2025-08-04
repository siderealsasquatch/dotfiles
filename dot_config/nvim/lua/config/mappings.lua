-- Set leader key to <space>
local global = vim.g
global.mapleader = " "
global.maplocalleader = " "

-- Set global keybinds
local utils = require("utils")

-- Window splits
utils.map("n", "<leader>wh", ":sp<CR>") -- horizontal
utils.map("n", "<leader>wv", ":vsp<CR>") -- vertical

-- Quickfix list
utils.map("n", "<C-M-j>", "<cmd>cnext<CR>")
utils.map("n", "<C-M-k>", "<cmd>cprev<CR>")
utils.map("n", "<leader>co", "<cmd>copen<CR>")
utils.map("n", "<leader>cc", "<cmd>cclose<CR>")
utils.map("n", "<leader>ce", "<cmd>cfdo edit | cclose<CR>")

-- Switch between windows
utils.map("n", "<C-H>", "<C-W>h")
utils.map("n", "<C-J>", "<C-W>j")
utils.map("n", "<C-K>", "<C-W>k")
utils.map("n", "<C-L>", "<C-W>l")

-- Buffers
-- utils.map("n", "]b", ":bnext<CR>")
-- utils.map("n", "[b", ":bprevious<CR>")
utils.map("n", "<tab>", ":b#<CR>")
utils.map("n", "<C-C>", ":bd<CR>")

-- Copying to system clipboard
utils.map({ "v", "n" }, "<leader>y", '"+y')
utils.map("n", "<leader>yy", '"+yy')

-- Pasting from system clipboard
utils.map({ "v", "n" }, "<leader>p", '"+p')

-- Open netrw
-- Remove for now since I'm using oil
-- utils.map("n", "<leader>nt", ":Ex<CR>")
