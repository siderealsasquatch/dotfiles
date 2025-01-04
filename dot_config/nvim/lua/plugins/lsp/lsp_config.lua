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

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
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
					"mypy",
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
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				lua_ls = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
							},
						},
					})
				end,
				gopls = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								gofumpt = true,
							},
						},
					})
				end,
				htmx = function()
					lspconfig.htmx.setup({
						capabilities = capabilities,
						filetypes = { "hmtl", "htmldjango", "templ" },
					})
				end,
				tailwindcss = function()
					lspconfig.tailwindcss.setup({
						capabilities = capabilities,
						filetypes = { "hmtl", "htmldjango", "templ", "javascript", "typescript" },
						init_options = { userLanguages = { templ = "html" } },
					})
				end,
				emmet_ls = function()
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						filetypes = { "css", "hmtl", "htmldjango", "templ" },
					})
				end,
				basedpyright = function()
					lspconfig.basedpyright.setup({
						capabilities = capabilities,
						disableOrganizeImports = true,
						analysis = {
							autoImportCompletions = true,
							typeCheckingMode = "off",
						},
					})
				end,
			}

			mason_lspconfig.setup_handlers(handlers)

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
