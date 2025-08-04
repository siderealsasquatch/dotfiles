return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "html", "htmldjango", "templ", "javascriptreact", "typescriptreact" },
	settings = {
		tailwindCSS = {
			includeLanguages = {
				templ = "html",
			},
		},
	},
}
