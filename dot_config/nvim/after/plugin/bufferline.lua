require("bufferline").setup({
	options = {
		separator_style = "slant",
		color_icons = true,
	},
})

local map = vim.keymap.set
map("n", "]b", ":BufferLineCycleNext<CR>", {})
map("n", "[b", ":BufferLineCyclePrev<CR>", {})
map("n", "<leader>bp", ":BufferLinePick<CR>", {})
map("n", "<leader>bc", ":BufferLinePickClose<CR>", {})
