return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			providers = { "treesitter" },
		})
	end,
}
