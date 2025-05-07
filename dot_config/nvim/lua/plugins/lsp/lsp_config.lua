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
			local lspconfig = require("lspconfig")
			local utils = require("utils")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					utils.map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					utils.map("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					utils.map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					utils.map("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
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
					-- Markdown
					"marksman",
					-- Docker stuff
					"dockerls",
					"docker_compose_language_service",
				},
			})

			vim.diagnostic.config({
				-- virtual_text = false,
				severity_sort = true,
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
