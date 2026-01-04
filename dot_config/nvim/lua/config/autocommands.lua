local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local yank_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = yank_group,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "150" })
	end,
})

-- additional filetypes
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

-- Set filtypes based on extension
local file_types = augroup("CustomFileTypes", { clear = true })
autocmd({ "BufNewFile", "BufRead" }, {
	group = file_types,
	pattern = { "*.gohtml" },
	callback = function()
		vim.opt_local.filetype = "html"
	end,
})
autocmd({ "BufNewFile", "BufRead" }, {
	group = file_types,
	pattern = { ".env*" },
	callback = function()
		vim.opt_local.filetype = "config"
	end,
})

-- File formatting based on file type
local custom_file_formatting = augroup("CustomFileFormatting", { clear = true })
autocmd("FileType", {
	group = custom_file_formatting,
	pattern = { "r", "rmd" },
	command = [[setlocal expandtab tw=80]],
})
autocmd("FileType", {
	group = custom_file_formatting,
	pattern = { "python" },
	command = [[setlocal expandtab tw=88]], -- Set to 88 specifically for black
})
autocmd("FileType", {
	group = custom_file_formatting,
	pattern = { "markdown" },
	command = [[setlocal expandtab ts=2 softtabstop=2 shiftwidth=2 tw=90]],
})
autocmd("FileType", {
	group = custom_file_formatting,
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html" },
	command = [[setlocal expandtab ts=2 softtabstop=2 shiftwidth=2]],
})
autocmd("FileType", {
	group = custom_file_formatting,
	pattern = { "c", "cpp" },
	command = [[setlocal expandtab ts=2 softtabstop=2 shiftwidth=2 tw=80]],
})
