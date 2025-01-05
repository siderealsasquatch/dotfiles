return {
	"saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		-- { "honza/vim-snippets" },
		"rafamadriz/friendly-snippets",

		-- Better icons
		-- { "onsails/lspkind-nvim" },
	},
	opts = {
		keymap = {
			preset = "default",
			-- ["<CR>"] = { "select_and_accept" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
	},
}
