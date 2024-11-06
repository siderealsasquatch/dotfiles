local utils = require("utils")

return {
	"leath-dub/snipe.nvim",
	config = function()
		-- Plugin setup
		local snipe = require("snipe")
		snipe.setup({
			-- ui = {
			-- 	position = "center",
			-- },
			hints = {
				dictionary = "aefghilmnoprtuvwxyz",
			},
			navigate = {
				close_buffer = "q",
			},
		})

		-- Keybindings
		utils.map("n", "np", snipe.open_buffer_menu)
	end,
}
