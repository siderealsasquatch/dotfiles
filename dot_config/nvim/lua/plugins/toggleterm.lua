return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
		},
	},
	config = function()
		-- local augroup = vim.api.nvim_create_augroup
		-- local autocmd = vim.api.nvim_create_autocmd
		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		end

		-- Find a way to make this work in lua
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		-- local toggleterm_grp = augroup("toggleterm", { clear = true })
		-- autocmd("TermOpen", {
		-- 	group = toggleterm_grp,
		-- 	command = [[term://* lua set_terminal_keymaps()]],
		-- })

		-- Configure keybindings and other options
		-- =======================================
		local Terminal = require("toggleterm.terminal").Terminal
		local utils = require("utils")

		-- Lazygit
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		utils.map("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
	end,
}
