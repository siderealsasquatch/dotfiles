return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- Configure gitsigns
		require("gitsigns").setup()

		-- Keybindings
		local gs = package.loaded.gitsigns
		local utils = require("utils")

		-- Navigation
		utils.map("n", "]h", function()
			if vim.wo.diff then
				return "]h"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		utils.map("n", "[h", function()
			if vim.wo.diff then
				return "[h"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		utils.map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
		utils.map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
		utils.map("n", "<leader>hS", gs.stage_buffer)
		utils.map("n", "<leader>hu", gs.undo_stage_hunk)
		utils.map("n", "<leader>hR", gs.reset_buffer)
		utils.map("n", "<leader>hp", gs.preview_hunk)
		utils.map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		utils.map("n", "<leader>hbt", gs.toggle_current_line_blame)
		utils.map("n", "<leader>hd", gs.diffthis)
		utils.map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		utils.map("n", "<leader>hdt", gs.toggle_deleted)

		-- Text object
		-- utils.map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
}
