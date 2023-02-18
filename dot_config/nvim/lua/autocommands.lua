local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "150" })
	end,
})

-- File formatting based on file type
autocmd("FileType", {
	-- pattern = { "*.py", "*.r", "*.rmd" },
	pattern = { "python", "r", "rmd" },
	command = [[setlocal expandtab tw=80]],
})
autocmd("FileType", {
	pattern = { "markdown" },
	command = [[setlocal expandtab ts=2 softtabstop=2 shiftwidth=2 tw=80]],
})
autocmd("FileType", {
	pattern = { "javascript" },
	command = [[setlocal expandtab ts=2 softtabstop=2 shiftwidth=2 tw=80]],
})
