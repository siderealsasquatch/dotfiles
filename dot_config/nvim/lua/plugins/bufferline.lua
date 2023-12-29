local utils = require("utils")

return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				color_icons = true,
				diagnostics = "nvim_lsp",
			},
		})
		utils.map("n", "]b", ":BufferLineCycleNext<CR>", {})
		utils.map("n", "[b", ":BufferLineCyclePrev<CR>", {})
		utils.map("n", "<leader>bp", ":BufferLinePick<CR>", {})
		utils.map("n", "<leader>bc", ":BufferLinePickClose<CR>", {})
	end,
}
