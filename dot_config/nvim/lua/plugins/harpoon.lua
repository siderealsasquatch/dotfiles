return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local utils = require("utils")
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		utils.map("n", "<leader>a", function()
			harpoon:list():add()
		end)
		utils.map("n", "<leader>hp", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- Try this out
		utils.map("n", "<C-M-u>", function()
			harpoon:list():select(1)
		end)
		utils.map("n", "<C-M-i>", function()
			harpoon:list():select(2)
		end)
		utils.map("n", "<C-M-o>", function()
			harpoon:list():select(3)
		end)
		utils.map("n", "<C-M-p>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		utils.map("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		utils.map("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
