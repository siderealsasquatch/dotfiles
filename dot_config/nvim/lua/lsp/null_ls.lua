local lsp = require("lsp-zero")
local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

mason_null_ls.setup({
	ensure_installed = {
		-- Lua
		"stylua",
		-- Python
		"isort",
		"ruff",
		"black",
		-- Javascript
		"prettierd",
		-- Go
		"revive",
		"goimports",
		-- Shell
		"shellcheck",
	},
	automatic_installation = true,
	automatic_setup = true,
	handlers = {},
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.diagnostics.golangci_lint,
	},
})

-- Keybindings
-- ***********

local map = vim.keymap.set

-- Manually format buffer
map("n", "<leader>bf", vim.lsp.buf.format)
