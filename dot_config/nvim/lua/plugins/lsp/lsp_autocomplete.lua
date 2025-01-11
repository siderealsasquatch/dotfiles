return {
	"saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"rafamadriz/friendly-snippets",
		"xzbdmw/colorful-menu.nvim",
	},
	config = function()
		local colorful_menu = require("colorful-menu")
		colorful_menu.setup()
		require("blink.cmp").setup({
			keymap = {
				preset = "default",
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets" },
			},
			completion = {
				menu = {
					draw = {
						treesitter = { "lsp" },
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
						components = {
							label = {
								text = colorful_menu.blink_components_text,
								highlight = colorful_menu.blink_components_highlight,
							},
						},
					},
				},
			},
			snippets = {
				preset = "luasnip",
			},
		})
	end,
}
