require("trouble").setup()

-- Keybindings
-- ***********

local map = vim.keymap.set
local opts = { silent = true, noremap = true }
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", opts)
-- map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
