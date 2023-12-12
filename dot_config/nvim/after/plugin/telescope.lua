local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

-- Initial telescope setup
-- Need to figure out how to make the "flex" layout work
telescope.setup({
	defaults = {
		sorting_strategy = "ascending", -- puts the results directly under the prompt
		layout_strategy = "vertical",
		layout_config = {
			-- Set preview_cutoff to 1 in order to enable file previews
			-- Not sure if it needs to be set for each part of the previewer but I'll do
			-- it anyway just to be safe.
			bottom_pane = { preview_cutoff = 1 },
			center = { preview_cutoff = 1 },
			cursor = { preview_cutoff = 1 },
			horizontal = { preview_cutoff = 1 },
			vertical = { preview_cutoff = 1 },
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-b>"] = actions.results_scrolling_up,
				["<C-f>"] = actions.results_scrolling_down,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<c-d>"] = require("telescope.actions").delete_buffer,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				-- Use defaults for tab
				-- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				-- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				-- ["<Tab>"] = actions.close,
				-- ["<S-Tab>"] = actions.close,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-h>"] = actions.which_key, -- keys from pressing <C-h>
				["<esc>"] = actions.close,
			},
			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-b>"] = actions.results_scrolling_up,
				["<C-f>"] = actions.results_scrolling_down,

				-- Use defaults for tab
				-- ["<Tab>"] = actions.close,
				-- ["<S-Tab>"] = actions.close,
				-- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				-- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,
				["q"] = actions.close,
				["dd"] = require("telescope.actions").delete_buffer,
				["s"] = actions.select_horizontal,
				["v"] = actions.select_vertical,
				["t"] = actions.select_tab,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	-- Leave this here for now in case I need to have a custom layout for one of the pickers I'm using
	pickers = {
		-- live_grep = {
		-- 	theme = "ivy",
		-- },
		-- grep_string = {
		-- 	theme = "ivy",
		-- },
		find_files = {
			no_ignore = true,
		},
		-- oldfiles = {
		-- 	theme = "ivy",
		-- },
		-- buffers = {
		-- 	theme = "ivy",
		-- },
		-- help_tags = {
		-- 	theme = "ivy",
		-- },
		-- marks = {
		-- 	theme = "ivy",
		-- },
		-- current_buffer_fuzzy_find = {
		-- 	theme = "ivy",
		-- },
	},
	extensions = {
		undo = {
			side_by_side = true,
			-- layout_strategy = "dropdown",
			-- sorting_strategy = "ascending",
			-- layout_config = {
			-- 	-- preview_height = 0.8,
			-- 	prompt_position = "top",
			-- },
		},
	},
})

-- Load extensions
require("telescope").load_extension("undo")

-- Keybindings
local map = vim.keymap.set
map("n", "<leader>sp", builtin.find_files, {})
map("n", "<leader>so", builtin.oldfiles, {})
map("n", "<leader>sg", builtin.live_grep, {})
map("n", "<leader>ss", builtin.grep_string, {})
map("n", "<leader>sb", builtin.buffers, {})
map("n", "<leader>sz", builtin.current_buffer_fuzzy_find, {})
map("n", "<leader>sh", builtin.help_tags, {})
map("n", "<leader>sm", builtin.marks, {})
map("n", "<leader>sj", builtin.jumplist, {})
map("n", "<leader>su", "<cmd>Telescope undo<CR>", {})
