return {
	"sindrets/diffview.nvim",
	-- lazy = true,
	config = function()
		-- Configure diffview
		require("diffview").setup()

		-- Keybindings
		local utils = require("utils")

		utils.map("n", "<leader>do", "<cmd>DiffviewOpen<cr>")
		utils.map("n", "<leader>dh", "<cmd>DiffviewFileHistory<cr>")
		utils.map("n", "<leader>df", "<cmd>DiffviewFileHistory %<cr>")
	end,
}
