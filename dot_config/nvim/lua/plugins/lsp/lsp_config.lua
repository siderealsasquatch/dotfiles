local utils = require("utils")

return {
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lspsaga").setup({
				outline = {
					win_width = 50,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lspconfig = require("lspconfig")
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				-- lsp_zero.default_keymaps({ buffer = bufnr })
				local bufopts = { noremap = true, silent = true, buffer = bufnr }

				-- LpsSaga
				utils.map("n", "gf", "<cmd>Lspsaga finder<CR>", bufopts)
				utils.map("n", "gi", "<cmd>Lspsaga finder imp<cr>", bufopts)
				utils.map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
				utils.map("n", "gD", "<cmd>Lspsaga peek_definition<CR>")
				utils.map("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", bufopts)
				utils.map("n", "gT", "<cmd>Lspsaga peek_type_definition<cr>", bufopts)
				utils.map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", bufopts)
				utils.map({ "n", "v" }, "<leader>vca", "<cmd>Lspsaga code_action<CR>", bufopts)
				utils.map("n", "<leader>vrn", "<cmd>Lspsaga rename<CR>", bufopts)
				utils.map("n", "ec", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
				utils.map("n", "el", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
				utils.map("n", "eb", "<cmd>Lspsaga show_buf_diagnostics<CR>", bufopts)
				utils.map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
				utils.map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
				utils.map("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
				utils.map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", bufopts)
			end)

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
			require("mason-lspconfig").setup({
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
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function() -- Might get rid of this
						local lua_opts = lsp_zero.nvim_lua_ls()
						lspconfig.lua_ls.setup(lua_opts)
					end,
					gopls = function()
						lspconfig.gopls.setup({
							settings = {
								gopls = {
									gofumpt = true,
								},
							},
						})
					end,
					htmx = function()
						lspconfig.htmx.setup({
							filetypes = { "hmtl", "htmldjango", "templ" },
						})
					end,
					tailwindcss = function()
						lspconfig.tailwindcss.setup({
							filetypes = { "hmtl", "htmldjango", "templ", "javascript", "typescript" },
							init_options = { userLanguages = { templ = "html" } },
						})
					end,
					emmet_ls = function()
						lspconfig.emmet_ls.setup({
							filetypes = { "css", "hmtl", "htmldjango", "templ" },
						})
					end,
					basedpyright = function()
						lspconfig.basedpyright.setup({
							disableOrganizeImports = true,
							analysis = {
								autoImportCompletions = true,
								typeCheckingMode = "off",
							},
						})
					end,
				},
			})

			lsp_zero.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "",
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
