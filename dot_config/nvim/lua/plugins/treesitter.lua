return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		-- Ensure that syntax highlighting is enabled for the current buffer
		local treesitter = vim.api.nvim_create_augroup("TreesitterConfig", { clear = true })
		vim.api.nvim_create_autocmd("BufReadPost", {
			group = treesitter,
			pattern = "*",
			callback = function()
				vim.treesitter.start()
			end,
		})

		require("nvim-treesitter").install({
			"comment",
			"gitignore",
			"make",
			"just",
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
			"templ",
			"python",
			"r",
			"ocaml",
			"c",
			"rust",
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
