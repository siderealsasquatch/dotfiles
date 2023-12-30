return {
	"nvim-neotest/neotest",
	dependencies = {
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-go",
	},
	config = function()
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

		-- neotest config
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
		local utils = require("utils")

		-- Run the nearest test
		utils.map("n", "<leader>tr", function()
			neotest.run.run()
		end)

		-- Run the current test file
		utils.map("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end)

		-- Run the last test
		utils.map("n", "<leader>tl", function()
			neotest.run.run_last()
		end)

		-- Toggle the summary panel
		utils.map("n", "<leader>ts", function()
			neotest.summary.toggle()
		end)

		-- Get the output of the current test
		utils.map("n", "<leader>to", function()
			neotest.output.open()
		end)

		-- Toggle the output panel
		utils.map("n", "<leader>ta", function()
			neotest.output_panel.toggle()
		end)
	end,
}
