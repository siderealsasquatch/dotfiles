-- Taken from "https://github.com/kkalamarski/neovim-config". Will keep it like this for
-- now.
local g = vim.g
local map = vim.keymap.set

-- Remove floaterm titles
g.floaterm_title = ""

-- Open new terminal
map("t", "<Leader>fn", "<C-\\><C-n>:FloatermNew --height=0.8 --width=0.8 --autoclose=2<CR>") -- open new terminal
map("n", "<Leader>fn", ":FloatermNew --height=0.8 --width=0.8 --autoclose=2<CR>") -- open new terminal

-- Toggle current terminal
map("t", "<leader>ft", "<C-\\><C-n>:FloatermToggle<CR>") -- toggle terminal
map("n", "<Leader>ft", ":FloatermToggle <CR>")

-- Cycle through terminals
map("t", "<leader>f[", "<C-\\><C-n>:FloatermPrev<CR>") -- switch terminals
map("n", "<leader>f[", ":FloatermPrev<CR>")
map("t", "<leader>f]", "<C-\\><C-n>:FloatermNext<CR>")
map("n", "<leader>f]", ":FloatermNext<CR>")

-- Kill terminals
map("t", "<Leader>fd", "<C-\\><C-n>:FloatermKill<CR>") -- kill current terminal
map("n", "<Leader>fd", ":FloatermKill<CR>")
map("t", "<Leader>fd", "<C-\\><C-n>:FloatermKill<CR>") -- kill all terminals
map("n", "<Leader>fD", ":FloatermKill!<CR>")

-- Send lines to current terminal
map("v", "<C-c><C-c>", ":'<,'>FloatermSend<CR>") -- current selection
map("n", "<C-c><C-x>", ":%FloatermSend<CR>")

-- Open LazyGit in a new terminal
map("n", "<leader>fg", ":FloatermNew --height=0.8 --width=0.8 --autoclose=2 lazygit<CR>")

-- Open Ranger in a new terminal
map("n", "<leader>fr", ":FloatermNew --height=0.8 --width=0.8 --autoclose=2 ranger<CR>")
