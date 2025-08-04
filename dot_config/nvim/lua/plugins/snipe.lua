return {
	"leath-dub/snipe.nvim",
	config = function()
		-- Setup plugin
		local snipe = require("snipe")

		snipe.setup({
			ui = {
				position = "center",
				text_align = "file-first",
			},
			hints = {
				dictionary = "asdfghjklwertyuiopzxcvbnm",
			},
			navigate = {
				cancel_snipe = "q",
			},
		})

		-- Keybindings
		local utils = require("utils")
		utils.map("n", "<c-p>", snipe.open_buffer_menu)
	end,
}
