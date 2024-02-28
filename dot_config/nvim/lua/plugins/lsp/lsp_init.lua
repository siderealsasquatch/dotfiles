return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		},
	},
}
