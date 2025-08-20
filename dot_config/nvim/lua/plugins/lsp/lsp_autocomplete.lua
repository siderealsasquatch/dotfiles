return {
	"saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		"xzbdmw/colorful-menu.nvim",
		"brenoprata10/nvim-highlight-colors",
		"moyiz/blink-emoji.nvim",
		"MahanRahmati/blink-nerdfont.nvim",
	},
	config = function()
		-- Setup and configure nvim-highlight-colors
		local nvim_hl_colors = require("nvim-highlight-colors")
		nvim_hl_colors.setup({
			enable_tailwind = true,
		})

		-- Setup and configure colorful-menu
		local colorful_menu = require("colorful-menu")
		colorful_menu.setup()

		-- Setup and configure blink.cmp
		require("blink.cmp").setup({
			keymap = {
				preset = "default",
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = {
				enabled = true,
				trigger = {
					enabled = true,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "emoji", "nerdfont", "dadbod" },
				providers = {
					emoji = { name = "Emoji", module = "blink-emoji" },
					nerdfont = { name = "Nerd Fonts", module = "blink-nerdfont" },
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				},
			},
			completion = {
				accept = {
					auto_brackets = {
						-- Somehow this conflicts somewhat with the signature.trigger.enabled option. Disabling this until
						-- I can find a solution that allows me to use both auto-brackets and auto-display for the signature help.
						enabled = false,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					update_delay_ms = 50,
				},
				menu = {
					draw = {
						treesitter = { "lsp" },
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
						components = {
							kind_icon = {
								ellipsis = false,
								-- Will need to figure out how to get the highlight icons to work with the mini icons
								text = function(ctx)
									local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
									if ctx.item.source_name == "LSP" then
										local color_item =
											nvim_hl_colors.format(ctx.item.documentation, { kind = ctx.kind })
										if color_item and color_item.abbr ~= "" then
											kind_icon = color_item.abbr
										end
									end
									return kind_icon .. ctx.icon_gap
								end,
								highlight = function(ctx)
									-- default highlight group
									local highlight = "BlinkCmpKind" .. ctx.kind
									if ctx.item.source_name == "LSP" then
										local color_item =
											nvim_hl_colors.format(ctx.item.documentation, { kind = ctx.kind })
										if color_item and color_item.abbr_hl_group then
											highlight = color_item.abbr_hl_group
										end
									end
									return highlight
								end,
							},
							label = {
								text = colorful_menu.blink_components_text,
								-- text = function(ctx)
								-- 	return colorful_menu.blink_components_text(ctx)
								-- end,
								highlight = colorful_menu.blink_components_highlight,
								-- highlight = function(ctx)
								-- 	colorful_menu.blink_components_highlight(ctx)
								-- end,
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
