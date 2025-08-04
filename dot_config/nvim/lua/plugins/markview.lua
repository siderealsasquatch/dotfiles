return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	config = function()
		require("markview").setup({
			experimental = {
				check_rtp = false,
			},
			preview = {
				enable = true,
				icon_provider = "mini",
			},
		})
	end,
}
