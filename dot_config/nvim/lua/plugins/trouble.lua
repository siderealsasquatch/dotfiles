return {
	"folke/trouble.nvim",
	opts = {},
	config = function()
		-- Keybindings
		-- ***********
		local utils = require("utils")
		local opts = { silent = true, noremap = true }
		utils.map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
		utils.map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
		utils.map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
		utils.map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
		utils.map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
		utils.map("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", opts)
		-- utils.map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
	end,
}
