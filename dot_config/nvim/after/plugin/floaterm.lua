-- Taken from "https://github.com/kkalamarski/neovim-config". Will keep it like this for
-- now.
local g = vim.g
local map = vim.keymap.set

-- Remove floaterm titles
g.floaterm_title = ""

-- Open new terminal
map("t", "<Leader>tn", "<C-\\><C-n>:FloatermNew --height=0.8 --width=0.8 --autoclose=2<CR>") -- open new terminal
map("n", "<Leader>tn", ":FloatermNew --height=0.8 --width=0.8 --autoclose=2<CR>") -- open new terminal

-- Toggle current terminal
map("t", "<leader>tt", "<C-\\><C-n>:FloatermToggle<CR>") -- toggle terminal
map("n", "<Leader>tt", ":FloatermToggle <CR>")

-- Cycle through terminals
map("t", "<leader>t[", "<C-\\><C-n>:FloatermPrev<CR>") -- switch terminals
map("n", "<leader>t[", ":FloatermPrev<CR>")
map("t", "<leader>t]", "<C-\\><C-n>:FloatermNext<CR>")
map("n", "<leader>t]", ":FloatermNext<CR>")

-- Kill terminals
map("t", "<Leader>td", "<C-\\><C-n>:FloatermKill<CR>") -- kill current terminal
map("n", "<Leader>td", ":FloatermKill<CR>")
map("t", "<Leader>td", "<C-\\><C-n>:FloatermKill<CR>") -- kill all terminals
map("n", "<Leader>tD", ":FloatermKill!<CR>")

-- Send lines to current terminal
map("v", "<C-c><C-c>", ":'<,'>FloatermSend<CR>") -- current selection
map("n", "<C-c><C-x>", ":%FloatermSend<CR>")

-- Open LazyGit in a new terminal
map("n", "<leader>tg", ":FloatermNew --height=0.8 --width=0.8 --autoclose=2 lazygit<CR>")

-- Open Ranger in a new terminal
map("n", "<leader>tr", ":FloatermNew --height=0.8 --width=0.8 --autoclose=2 ranger<CR>")
