return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup()
		local utils = require("utils")

		-- Keybindings
		local opts = { silent = true, noremap = true }
		utils.map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
		utils.map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
		utils.map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
		utils.map("n", "<leader>xl", "<cmd>Trouble ls toggle focus=false win.position=right<cr>", opts)
		utils.map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)
		utils.map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opts)
	end,
}
