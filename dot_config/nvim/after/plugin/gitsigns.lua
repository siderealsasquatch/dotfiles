require("gitsigns").setup()

-- Keybindings
-- ***********
local gs = package.loaded.gitsigns

local function set(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

-- Navigation
set("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		gs.next_hunk()
	end)
	return "<Ignore>"
end, { expr = true })

set("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		gs.prev_hunk()
	end)
	return "<Ignore>"
end, { expr = true })

-- Actions
set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
set("n", "<leader>hS", gs.stage_buffer)
set("n", "<leader>hu", gs.undo_stage_hunk)
set("n", "<leader>hR", gs.reset_buffer)
set("n", "<leader>hp", gs.preview_hunk)
set("n", "<leader>hb", function()
	gs.blame_line({ full = true })
end)
set("n", "<leader>hbt", gs.toggle_current_line_blame)
-- set('n', '<leader>tb', gs.toggle_current_line_blame)
set("n", "<leader>hd", gs.diffthis)
set("n", "<leader>hD", function()
	gs.diffthis("~")
end)
-- set('n', '<leader>td', gs.toggle_deleted)

-- Text object
-- set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
