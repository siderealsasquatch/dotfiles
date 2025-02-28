local M = {
	enabled = true,
	layout = {
		preset = "bottom",
		-- preset = "dropdown",
	},
	matcher = {
		frecency = true,
	},
	formatters = {
		file = { filename_first = true },
	},
}

return M
