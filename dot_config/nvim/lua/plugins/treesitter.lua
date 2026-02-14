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
		-- vim.api.nvim_create_autocmd("BufReadPost", {
		-- 	group = treesitter,
		-- 	pattern = "*",
		-- 	callback = function()
		-- 		vim.treesitter.start()
		-- 	end,
		-- 	-- once = true,
		-- })
		vim.api.nvim_create_autocmd("FileType", {
			group = treesitter,
			pattern = "*",
			callback = function(details)
				local bufnr = details.buf
				if not pcall(vim.treesitter.start, bufnr) then -- try to start treesitter which enables syntax highlighting
					return -- Exit if treesitter was unable to start
				end
				-- vim.bo[bufnr].syntax = "on" -- Use regex based syntax-highlighting as fallback as some plugins might need it
				-- vim.wo.foldlevel = 99
				-- vim.wo.foldmethod = "expr"
				-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folds
				vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Use treesitter for indentation
			end,
		})

		require("nvim-treesitter").install({
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
