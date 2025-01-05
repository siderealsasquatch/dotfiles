return {
	"leath-dub/snipe.nvim",
	config = function()
		-- Plugin setup
		local snipe = require("snipe")
		snipe.setup({
			ui = {
				position = "center",
			},
			hints = {
				dictionary = "aefghilmnoprtuvwxyz",
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
