local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use("Mofiqul/dracula.nvim")
	use("rafamadriz/neon")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("kvrohit/mellow.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")
	use("onsails/lspkind-nvim")

	-- Syntax highlighting
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- LSP stuff
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			-- { "rafamadriz/friendly-snippets" },
			{ "honza/vim-snippets" },
		},
	})
	use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- Linting and formatting
	-- Configure these later
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Telescope extensions
	use("debugloop/telescope-undo.nvim")

	-- Prettier diagnostics
	use("folke/trouble.nvim")

	-- Fancy status line
	use("nvim-lualine/lualine.nvim")

	-- Fancy buffer line
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })

	-- File tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	-- Testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"antoinemadec/FixCursorHold.nvim",
		},
	})
	use("nvim-neotest/neotest-python")
	use("nvim-neotest/neotest-go")

	-- Additional functionality
	use("kylechui/nvim-surround")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("lewis6991/gitsigns.nvim")
	use("jinh0/eyeliner.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	-- use("voldikss/vim-floaterm")
	use("RRethy/vim-illuminate")
	use({
		"ggandor/leap.nvim",
		requires = { { "tpope/vim-repeat" } },
	})
	use({
		"andymass/vim-matchup",
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
