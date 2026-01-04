return {
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
					vim.keymap.set("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					vim.keymap.set({ "n", "v" }, "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})

			require("mason").setup({})
			require("mason-tool-installer").setup({
				-- I'm using this exclusively for linters and formatters
				ensure_installed = {
					-- Linters
					"eslint_d",
					"golangci-lint",
					"ruff",
					-- Formatters
					"stylua",
					"djlint",
					"gofumpt",
					"goimports",
					"prettierd",
					"ocamlformat",
					"clang-format",
				},
			})
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				-- I'm using this exclusively for LSPs
				ensure_installed = {
					-- Javascript and web stuff
					"ts_ls",
					"eslint",
					"html",
					"emmet_ls",
					"tailwindcss",
					-- Lua
					"lua_ls",
					-- Python
					"ty",
					-- Go
					"gopls",
					"templ",
					-- Rust
					"rust_analyzer",
					-- OCaml
					"ocamllsp",
					-- C
					"clangd",
					-- Markdown
					"marksman",
				},
			})

			vim.lsp.config("*", {
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})

			vim.diagnostic.config({
				severity_sort = true,
				virtual_lines = {
					current_line = true,
				},
				float = {
					-- style = "minimal",
					-- border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
				signs = {
					-- text = {
					-- 	[vim.diagnostic.severity.ERROR] = "✘",
					-- 	[vim.diagnostic.severity.WARN] = "▲",
					-- 	[vim.diagnostic.severity.HINT] = "⚑",
					-- 	[vim.diagnostic.severity.INFO] = "»",
					-- },
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.WARN] = "WarningMsg",
						[vim.diagnostic.severity.HINT] = "DiagnosticHint",
						[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
					},
				},
			})

			-- vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
		end,
	},
}
