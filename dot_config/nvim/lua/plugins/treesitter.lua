return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		-- Treesitter config
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"gitignore",
				"comment",
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
				"gomod",
				"gosum",
				"gotmpl",
				"templ",
				"python",
				"r",
				"c_sharp",
				"ocaml",
				"c",
				"dockerfile",
				"just",
			},
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			highlight = {
				enable = true, -- Must be set in order for highlighting to take effect
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>s",
					node_incremental = "<leader>s",
					scope_incremental = "<leader>ss",
					node_decremental = "<leader>sd",
				},
			},
			matchup = {
				enable = true,
			},
		})

		-- Treesitter context
		local context = require("treesitter-context")
		context.setup({
			enable = true, -- ensure that the plugin is enabled
		})

		-- Keybindings
		local utils = require("utils")

		utils.map("n", "<leader>c", function()
			context.go_to_context()
		end, { silent = true })
	end,
}
