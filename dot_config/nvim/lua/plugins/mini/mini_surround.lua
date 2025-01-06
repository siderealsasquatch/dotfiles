return {
	"echasnovski/mini.surround",
	version = false,
	config = function()
		require("mini.surround").setup({
			-- See how well these work for me first and then change them to the old
			-- surround mappings if they feel too weird
			mappings = {
				-- Default keybinds. Keep them around only as a reference
				-- add = "sa", -- Add surrounding in Normal and Visual modes
				-- delete = "sd", -- Delete surrounding
				-- find = "sf", -- Find surrounding (to the right)
				-- find_left = "sF", -- Find surrounding (to the left)
				-- highlight = "sh", -- Highlight surrounding
				-- replace = "sr", -- Replace surrounding
				-- update_n_lines = "sn", -- Update `n_lines`
				--
				-- suffix_last = "l", -- Suffix to search with "prev" method
				-- suffix_next = "n", -- Suffix to search with "next" method

				add = "as", -- Add surrounding in Normal and Visual modes
				delete = "ds", -- Delete surrounding
				find = "fs", -- Find surrounding (to the right)
				find_left = "Fs", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "rs", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})
	end,
}
