return {
	"stevearc/oil.nvim",
	config = function()
		-- Setup
		local oil = require("oil")
		oil.setup({
			-- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
			default_file_explorer = true,
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			-- Set to true to watch the filesystem for changes and reload oil
			watch_for_changes = true,
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
				natural_order = "fast",
				-- Sort file and directory names case insensitive
				case_insensitive = false,
			},
		})

		-- Keybindings
		local utils = require("utils")

		utils.map("n", "<leader>o", "<cmd>Oil<CR>")
	end,
}
