return {
	"leath-dub/snipe.nvim",
	config = function()
		-- Plugin setup
		local snipe = require("snipe")
		snipe.setup({
			ui = {
				position = "center",
				text_align = "file-first",
			},
			hints = {
				dictionary = "asdfghjklwertyuiop",
			},
			navigate = {
				close_buffer = "q",
			},
		})

		-- Keybindings
		local utils = require("utils")

		utils.map("n", "<C-p>", snipe.open_buffer_menu)
	end,
}
