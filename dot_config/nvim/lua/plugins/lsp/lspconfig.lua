-- Think about splitting this into three/four different files
local utils = require("utils")

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		-- init = function()
		-- 	-- Disable automatic setup, we are doing it manually
		-- 	vim.g.lsp_zero_extend_cmp = 0
		-- 	vim.g.lsp_zero_extend_lspconfig = 0
		-- end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		-- config = true,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Replicate functionality of v1.x of lsp-zero
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
			{ "honza/vim-snippets" },

			-- Better icons
			{ "onsails/lspkind-nvim" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()
			local lspkind = require("lspkind")

			-- Set LuaSnip to use honza snippets
			require("luasnip.loaders.from_snipmate").lazy_load()

			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				-- Might not even want to keep this window option
				window = {
					documentation = cmp.config.window.bordered(),
				},
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
				},
				mapping = cmp.mapping.preset.insert({

					-- confirm completion item
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					-- toggle completion menu
					-- ["<C-e>"] = cmp_action.toggle_completion(),

					-- tab complete
					["<Tab>"] = cmp_action.tab_complete(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),

					-- navigate between snippet placeholder
					["<C-n>"] = cmp_action.luasnip_jump_forward(),
					["<C-p>"] = cmp_action.luasnip_jump_backward(),

					-- scroll documentation window
					["<C-d>"] = cmp.mapping.scroll_docs(5),
					["<C-u>"] = cmp.mapping.scroll_docs(-5),
				}),
			})
		end,
	},

	-- LSP
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

				-- Built-in lsp
				-- utils.map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", bufopts)
				-- utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", bufopts)
				-- utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", bufopts)
				-- utils.map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", bufopts)
				-- utils.map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", bufopts)
				-- utils.map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>", bufopts)
				-- utils.map("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>", bufopts)
				-- utils.map("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<cr>", bufopts)
				-- utils.map("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>", bufopts)
				-- utils.map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", bufopts)
				-- utils.map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", bufopts)
				-- utils.map("n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<cr>", bufopts)
				-- utils.map("n", "]e", "<cmd>lua vim.diagnostic.goto_next()<cr>", bufopts)
				-- utils.map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", bufopts)
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Javascript and web stuff
					"tsserver",
					"eslint",
					"html",
					"emmet_ls",
					"tailwindcss",
					-- Lua
					"lua_ls",
					-- Python
					"jedi_language_server",
					-- "pyright",
					-- Go
					"gopls",
					"templ",
					-- Markdown
					"marksman",
				},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
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
				virtual_text = false,
				severity_sort = true,
				float = {
					-- style = "minimal",
					-- border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
		end,
	},

	-- Autoformatting
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			local lsp = require("lsp-zero")
			local null_opts = lsp.build_options("null-ls", {})
			local mason = require("mason")
			local mason_null_ls = require("mason-null-ls")
			local null_ls = require("null-ls")

			mason.setup()
			mason_null_ls.setup({
				ensure_installed = {
					-- Lua
					"stylua",
					-- Python
					"isort",
					"ruff",
					-- "flake8",
					-- "pylint",
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

			-- Don't think I need the "on_attach" part but will keep it here just in case

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

			-- Manually format buffer
			utils.map("n", "<leader>bf", vim.lsp.buf.format)
		end,
	},

	-- Prettier LSP stuff
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

			-- Keymaps
			-- *******
			utils.map("n", "gf", "<cmd>Lspsaga finder<CR>")
			utils.map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
			utils.map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
			utils.map({ "n", "v" }, "<leader>vca", "<cmd>Lspsaga code_action<CR>")
			utils.map("n", "<leader>vrn", "<cmd>Lspsaga rename<CR>")
			utils.map("n", "ec", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
			utils.map("n", "el", "<cmd>Lspsaga show_line_diagnostics<CR>")
			utils.map("n", "eb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
			utils.map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
			utils.map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
			utils.map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
			utils.map("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
		end,
	},
}
