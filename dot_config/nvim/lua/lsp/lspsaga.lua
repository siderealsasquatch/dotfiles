-- Set up the "lspsaga" plugin. Note that we will be overwriting some of the keybindings
-- that we defined for the autocompletions.

require("lspsaga").setup()

-- Keymaps
-- *******
local map = vim.keymap.set

map("n", "gd", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
map({ "n", "v" }, "<leader>vca", "<cmd>Lspsaga code_action<CR>")
map("n", "<leader>vrn", "<cmd>Lspsaga rename<CR>")
map("n", "ec", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
map("n", "el", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "eb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
