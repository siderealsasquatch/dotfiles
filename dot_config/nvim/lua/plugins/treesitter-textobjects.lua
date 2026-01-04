return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	lazy = true,
	init = function()
		vim.g.no_plugin_maps = true
	end,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				-- You can choose the select mode (default is charwise 'v')
				--
				-- Can also be a function which gets passed a table with the keys
				-- * query_string: eg '@function.inner'
				-- * method: eg 'v' or 'o'
				-- and should return the mode ('v', 'V', or '<c-v>') or a table
				-- mapping query_strings to modes.
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					-- ['@class.outer'] = '<c-v>', -- blockwise
				},
				-- If you set this to `true` (default is `false`) then any textobject is
				-- extended to include preceding or succeeding whitespace. Succeeding
				-- whitespace has priority in order to act similarly to eg the built-in
				-- `ap`.
				--
				-- Can also be a function which gets passed a table with the keys
				-- * query_string: eg '@function.inner'
				-- * selection_mode: eg 'v'
				-- and should return true of false
				include_surrounding_whitespace = false,
			},
			move = {
				-- whether to set jumps in the jumplist
				set_jumps = true,
			},
		})

		local utils = require("utils")

		-- Selection
		local ts_select = require("nvim-treesitter-textobjects.select")

		utils.map({ "x", "o" }, "am", function()
			ts_select.select_textobject("@function.outer", "textobjects")
		end)
		utils.map({ "x", "o" }, "im", function()
			ts_select.select_textobject("@function.inner", "textobjects")
		end)
		utils.map({ "x", "o" }, "ac", function()
			ts_select.select_textobject("@class.outer", "textobjects")
		end)
		utils.map({ "x", "o" }, "ic", function()
			ts_select.select_textobject("@class.inner", "textobjects")
		end)
		-- You can also use captures from other query groups like `locals.scm`
		utils.map({ "x", "o" }, "as", function()
			ts_select.select_textobject("@local.scope", "locals")
		end)

		-- Movement
		local ts_move = require("nvim-treesitter-textobjects.move")

		utils.map({ "n", "x", "o" }, "]m", function()
			ts_move.goto_next_start("@function.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "]]", function()
			ts_move.goto_next_start("@class.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "]o", function()
			ts_move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "]s", function()
			ts_move.goto_next_start("@local.scope", "locals")
		end)
		utils.map({ "n", "x", "o" }, "]z", function()
			ts_move.goto_next_start("@fold", "folds")
		end)
		utils.map({ "n", "x", "o" }, "]M", function()
			ts_move.goto_next_end("@function.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "][", function()
			ts_move.goto_next_end("@class.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "[m", function()
			ts_move.goto_previous_start("@function.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "[[", function()
			ts_move.goto_previous_start("@class.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "[M", function()
			ts_move.goto_previous_end("@function.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "[]", function()
			ts_move.goto_previous_end("@class.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "]d", function()
			ts_move.goto_next("@conditional.outer", "textobjects")
		end)
		utils.map({ "n", "x", "o" }, "[d", function()
			ts_move.goto_previous("@conditional.outer", "textobjects")
		end)

		-- Enable repetition as well as f and t functionality
		local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

		-- vim way: ; goes to the direction you were moving.
		utils.map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		utils.map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
		utils.map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr)
		utils.map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr)
		utils.map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr)
		utils.map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr)
	end,
}
