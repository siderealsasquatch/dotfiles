return {
	"nvim-mini/mini.surround",
	version = false,
	config = function()
		require("mini.surround").setup({
			-- See how well these work for me first and then change them to the old
			-- surround mappings if they feel too weird
			mappings = {
				-- Defaults
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

				-- Not sure what to do about the keybindings for find yet. Will leave
				-- them as is for now.
				add = "ar", -- Add surrounding in Normal and Visual modes
				delete = "dr", -- Delete surrounding
				find = "fr", -- Find surrounding (to the right)
				find_left = "Fr", -- Find surrounding (to the left)
				highlight = "rh", -- Highlight surrounding
				replace = "rs", -- Replace surrounding
				update_n_lines = "nr", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})
	end,
}
