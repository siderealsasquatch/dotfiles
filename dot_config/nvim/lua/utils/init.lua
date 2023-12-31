local M = {}

M = {
	-- Set keybinds
	map = function(mode, l, r, opts)
		opts = opts or {}
		vim.keymap.set(mode, l, r, opts)
	end,
}

return M
