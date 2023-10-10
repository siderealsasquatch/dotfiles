local lsp = require("lsp-zero")
lsp.preset("recommended")

-- Figure out how to install a nix language server
-- either "rnix" or "nil_ls"; something about cargo not being executable
lsp.ensure_installed({
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
	-- Go
	"gopls",
	-- Markdown
	"marksman",
})

-- Fix Undefined global 'vim' for the lua language server
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Configure completion menu
local lspkind = require("lspkind")
local cmp = require("cmp")
local luasnip = require("luasnip")
lsp.setup_nvim_cmp({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
	mapping = lsp.defaults.cmp_mappings({
		["<C-c>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

		-- go to next placeholder in the snippet
		["<C-e>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		-- go to previous placeholder in the snippet
		["<C-d>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
})

-- Use the default autocompletion mappings for now; configure them later

-- Define "on attach" keybinds
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>e", vim.diagnostic.open_float, opts)
map("n", "[e", vim.diagnostic.goto_prev, opts)
map("n", "]e", vim.diagnostic.goto_next, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
lsp.on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "gd", vim.lsp.buf.definition, bufopts)
	map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "gi", vim.lsp.buf.implementation, bufopts)
	map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	map("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	map("n", "<leader>vca", vim.lsp.buf.code_action, bufopts)
	map("n", "<leader>vrr", vim.lsp.buf.references, bufopts)
	map("n", "<leader>vrn", vim.lsp.buf.rename, bufopts)
	map("n", "<leader>f", vim.lsp.buf.formatting, bufopts)
end

-- Skip loading language server based on filetype
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufRead", "BufNewFile" }, {
	-- pattern = { "*.gohtml", "gotmpl" },
	pattern = { "gotmpl" },
	callback = function()
		lsp.skip_server_setup({ "gopls" })
	end,
})

lsp.setup()

vim.diagnostic.config({
	float = { source = "always" },
	virtual_text = false,
	signs = true,
})

-- Set LuaSnips to use the honza snippets
require("luasnip.loaders.from_snipmate").lazy_load()

-- Convert this to Lua at some point.
vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
