return {
	"sindrets/diffview.nvim",
	lazy = true,
	config = function()
		-- Configure diffview
		require("diffview").setup()

		-- Keybindings
		local utils = require("utils")

		utils.map("n", "<leader>do", ":DiffviewOpen<CR>")
		utils.map("n", "<leader>dh", ":DiffviewFileHistory<CR>")
		utils.map("n", "<leader>df", ":DiffviewFileHistory %<CR>")
	end,
}
