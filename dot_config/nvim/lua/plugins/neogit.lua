return {
	"NeogitOrg/neogit",
	config = function()
		local neogit = require("neogit")
		neogit.setup()

		-- Keybindings
		local utils = require("utils")

		-- Open menu
		utils.map("n", "<leader>ng", function()
			neogit.open()
		end)
	end,
}
