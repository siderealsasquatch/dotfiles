return {
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

				-- abort completion
				["<C-b>"] = cmp.mapping.abort(),

				-- toggle completion menu
				-- ["<C-e>"] = cmp_action.toggle_completion(),

				-- tab complete
				["<C-p>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item({ behavior = "insert" })
					else
						cmp.complete()
					end
				end),
				["<C-n>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item({ behavior = "insert" })
					else
						cmp.complete()
					end
				end),

				-- navigate between snippet placeholder
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-e>"] = cmp_action.luasnip_jump_backward(),

				-- scroll documentation window
				["<C-d>"] = cmp.mapping.scroll_docs(5),
				["<C-u>"] = cmp.mapping.scroll_docs(-5),
			}),
		})
	end,
}
