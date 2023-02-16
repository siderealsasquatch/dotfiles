-- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
			return message
		end,
	},
}, neotest_ns)

-- Configure neotest
local neotest = require("neotest")
neotest.setup({
	adapters = {
		require("neotest-python"),
		require("neotest-go"),
	},
	output = {
		enabled = true,
		open_on_run = true,
	},
})

-- Keybindings
local set = vim.keymap.set

-- Run the nearest test
set("n", "<leader>tr", function()
	neotest.run.run()
end)

-- Run the current test file
set("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end)

-- Run the last test
set("n", "<leader>tl", function()
	neotest.run.run_last()
end)

-- Toggle the summary panel
set("n", "<leader>ts", function()
	neotest.summary.toggle()
end)

-- Get the output of the current test
set("n", "<leader>toc", function()
	neotest.output.open()
end)

-- Toggle the output panel
set("n", "<leader>top", function()
	neotest.output_panel.toggle()
end)
