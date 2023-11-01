local set = vim.opt
local cmd = vim.cmd

-- Backups
set.backup = false
set.writebackup = false
set.swapfile = false

-- Mouse
set.mouse = ""

-- Mode indicator
set.showmode = false

-- Update period
set.updatetime = 300

-- Display
set.termguicolors = true
set.background = "dark"
cmd([[colorscheme catppuccin-mocha]])
set.signcolumn = "yes"

-- Cursor
set.cursorline = true

-- Line numbers
set.number = true
set.relativenumber = true

-- Formatting
set.autoindent = true
set.copyindent = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- Splits
set.splitright = true
set.splitbelow = true

-- Stuff for undo's
set.undodir = os.getenv("HOME") .. "/.nvim/undo" -- need to create first
set.undofile = true

-- Code folding
set.foldmethod = "manual"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- Spellcheck
set.spelllang = "en_us"
set.spell = true

-- Clipboard
vim.g.clipboard = {
	name = "win32yank-wsl",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
}
