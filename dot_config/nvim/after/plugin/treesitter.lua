require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"help",
		"comment",
		"javascript",
		"typescript",
		"lua",
		"bash",
		"go",
		"templ",
		"python",
		"markdown",
		"markdown_inline",
	},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	highlight = {
		enable = true, -- Must be set to true in order for highlighting to work
		additional_vim_regex_highlighting = false,
	},
	matchup = {
		enable = true,
	},
})

-- Enable tree-sitter-context
local context = require("treesitter-context")
context.setup()

-- Register custom parsers
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
	},
	filetype = "gotmpl",
	-- used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
	used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "html" },
}

-- Keybindings
local map = vim.keymap.set
map("n", "<leader>tc", function()
	context.go_to_context()
end, { silent = true })
