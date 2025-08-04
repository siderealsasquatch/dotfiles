return {
	cmd = { "gopls" },
	root_markers = {
		"go.mod",
		".git",
		"go.work",
	},
	filetypes = {
		"go",
		"gomod",
		"gowork",
		"gotmpl",
	},
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
}
