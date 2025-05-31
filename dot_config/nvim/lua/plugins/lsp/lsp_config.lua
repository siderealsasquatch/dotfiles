return {
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason-lspconfig.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim",
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local utils = require("utils")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					local bufnr = vim.api.nvim_get_current_buf()

					if
						#vim.lsp.get_clients({ bufnr = bufnr }) > 0
						and vim.lsp.get_clients({ bufnr = bufnr })[1].name == "omnisharp"
					then
						utils.map("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>", opts)
						utils.map("n", "gri", "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>", opts)
						utils.map("n", "go", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>", opts)
						utils.map("n", "grr", "<cmd>lua require('omnisharp_extended').lsp_references()<cr>", opts)
					else
						utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
						utils.map("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
						utils.map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
						utils.map("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					end

					utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					utils.map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					utils.map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					utils.map("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					utils.map("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
					utils.map({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					utils.map({ "n", "v" }, "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

					-- utils.map("n", "<leader>dl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
					-- utils.map("n", "[d", "<cmd>lua vim.diagnostic.jump({count = -1})<cr>", opts)
					-- utils.map("n", "]d", "<cmd>lua vim.diagnostic.jump({count = 1})<cr>", opts)
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
					"basedpyright",
					-- Go
					"gopls",
					"templ",
					-- OCaml
					"ocamllsp",
					-- C
					"clangd",
					-- C#
					"omnisharp",
					-- Markdown
					"marksman",
					-- Docker stuff
					"dockerls",
					"docker_compose_language_service",
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
				signs = {
					text = {
						-- [vim.diagnostic.severity.ERROR] = "✘",
						-- [vim.diagnostic.severity.WARN] = "▲",
						-- [vim.diagnostic.severity.HINT] = "⚑",
						-- [vim.diagnostic.severity.INFO] = "»",
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
				float = {
					-- style = "minimal",
					-- border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
		end,
	},
}
