return {
	"echasnovski/mini.pick",
	version = "*",
	dependencies = {
		{ "echasnovski/mini.extra", version = "*" },
	},
	config = function()
		-- Plugin setup
		require("mini.extra").setup()
		require("mini.pick").setup({
			mappings = {
				mark = "<C-r>",
			},
		})

		-- Plugin mappings
		local utils = require("utils")

		utils.map("n", "<leader>ff", ":Pick files<CR>")
		utils.map("n", "<leader>fg", ":Pick grep_live<CR>")
		utils.map("n", "<leader>fb", ":Pick buffers<CR>")
		utils.map("n", "<leader>fz", ":Pick buf_lines scope='current'<CR>")
		utils.map("n", "<leader>fm", ":Pick marks<CR>")
		utils.map("n", "<leader>fj", ":Pick list scope='jump'<CR>")
		utils.map("n", "<leader>fl", ":Pick list scope='location'<CR>")
		utils.map("n", "<leader>fq", ":Pick list scope='quickfix'<CR>")
		utils.map("n", "<leader>flr", ":Pick lsp scope='references'<CR>")
		utils.map("n", "<leader>flO", ":Pick lsp scope='document_symbol'<CR>")
		utils.map("n", "<leader>fli", ":Pick lsp scope='implementation'<CR>")
		utils.map("n", "<leader>fld", ":Pick lsp scope='definition'<CR>")
		utils.map("n", "<leader>flo", ":Pick lsp scope='type_definition'<CR>")
	end,
}
