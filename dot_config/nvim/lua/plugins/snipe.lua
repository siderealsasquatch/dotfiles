return {
	"leath-dub/snipe.nvim",
	config = function()
		-- Plugin setup
		local snipe = require("snipe")
		snipe.setup({
			ui = {
				position = "center",
				preselect_current = true,
				text_align = "file-first",
			},
			hints = {
				dictionary = "asdfglqwertyuiopbnm",
			},
			navigate = {
				close_buffer = "x",
			},
		})

		-- Keybindings
		local utils = require("utils")

		utils.map("n", "<C-p>", snipe.open_buffer_menu)
	end,
}
