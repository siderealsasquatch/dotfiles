require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"help",
		"javascript",
		"typescript",
		"lua",
		"bash",
		"go",
		"python",
		"markdown",
		"markdown_inline",
	},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	highlight = {
		enable = true, -- Must be set to true in order for highlighting to work
		additional_vim_regex_highlighting = false,
	},
	matchup = {
		enable = true,
	},
})
