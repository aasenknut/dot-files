-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- TPOPE
	use({ "tpope/vim-sensible" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-fugitive" })
	--- GIT (in addition to tpope/vim-fugitive)
	use({ "airblade/vim-gitgutter" })
	-- Colours
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("EdenEast/nightfox.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	--- LSP ---
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "onsails/lspkind-nvim" })
	use({ "simrat39/symbols-outline.nvim" })
	use({ "ray-x/lsp_signature.nvim" })
	use("jose-elias-alvarez/null-ls.nvim")

	--- SNIPPETS ---
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")

	--- DAP ---
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- FZF -- fuzzy finding
	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use({ "junegunn/fzf.vim" })
	use("gfanto/fzf-lsp.nvim")

	-- Ack
	use("mileszs/ack.vim")

	-- Go
	use({ "fatih/vim-go" })

	--- File explorer (tree view) ---
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})
	use({
		"ckolkey/ts-node-action",
		requires = { "nvim-treesitter" },
	})
	-- Other
	use("szw/vim-maximizer")
	use({ "mbbill/undotree" }) -- Overview of changes.
	use({ "nvim-lua/plenary.nvim" }) -- Requirement for some plugins. (might not be a requirement for any of the current plugins I use.)
end)
