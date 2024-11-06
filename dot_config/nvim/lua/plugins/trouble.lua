return {
	"folke/trouble.nvim",
	opts = {},
	config = function()
		-- Keybindings
		-- ***********
		local utils = require("utils")
		local opts = { silent = true, noremap = true }
		utils.map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
		utils.map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>", opts)
		utils.map("n", "<leader>xd", "<cmd>Trouble document_diagnostics toggle<cr>", opts)
		utils.map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", opts)
		utils.map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", opts)
		utils.map("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", opts)
		-- utils.map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
	end,
}
