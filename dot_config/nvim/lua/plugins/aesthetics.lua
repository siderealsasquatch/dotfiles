return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
	{
		"prichrd/netrw.nvim",
		lazy = false,
		opts = {},
	},
}
