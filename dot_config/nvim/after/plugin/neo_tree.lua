require("neo-tree").setup({
	close_if_last_window = false,
	enable_diagnostics = true,
	enable_git_status = true,
	popup_border_style = "rounded",
	sort_case_insensitive = false,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
	window = { width = 30 },
})

local set_g = vim.g
local map = vim.keymap.set

-- General options
-- ***************

-- Allow neo-tree to remove deprecated commands from v1.x
set_g.neo_tree_remove_legacy_commands = 1

-- Keybindings
-- ***********

local opts = { noremap = true, silent = true }

-- Toggle neo-tree
map("n", "<F5>", ":Neotree toggle<CR>", opts)
map("i", "<F5>", "<ESC> :Neotree toggle<CR>", opts)
