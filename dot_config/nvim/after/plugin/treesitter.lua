require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"help",
		"make",
		"ini",
		"toml",
		"yaml",
		"json",
		"markdown",
		"markdown_inline",
		"nix",
		"sql",
		"html",
		"css",
		"javascript",
		"typescript",
		"lua",
		"bash",
		"go",
		"python",
		"r",
	},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	highlight = {
		enable = true, -- Must be set in order for highlighting to take effect
		additional_vim_regex_highlighting = false,
	},
	matchup = {
		enable = true,
	},
})
