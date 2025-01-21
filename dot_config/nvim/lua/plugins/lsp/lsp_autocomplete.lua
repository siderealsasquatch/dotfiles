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
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
									return kind_icon
								end,
							},
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
				-- expand = function(snippet)
				-- 	require("luasnip").lsp_expand(snippet)
				-- end,
				-- active = function(filter)
				-- 	if filter and filter.direction then
				-- 		return require("luasnip").jumpable(filter.direction)
				-- 	end
				-- 	return require("luasnip").in_snippet()
				-- end,
				-- jump = function(direction)
				-- 	require("luasnip").jump(direction)
				-- end,
			},
		})
	end,
}
