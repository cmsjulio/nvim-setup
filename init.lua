require("zh3ro")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	{'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	dependencies = { {'nvim-lua/plenary.nvim'} } },
	{'rose-pine/neovim', name = 'rose-pine'},
	{	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			init = function()
				-- disable rtp plugin, as we only need its queries for mini.ai
				-- In case other textobject modules are enabled, we will load them
				-- once nvim-treesitter is loaded
				require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				load_textobjects = true
			end,
		},
	},
	cmd = { "TSUpdateSync" }
},
'theprimeagen/harpoon',
'mbbill/undotree',
'tpope/vim-fugitive',
{'williamboman/mason.nvim'},
{'williamboman/mason-lspconfig.nvim'},

{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
 "lewis6991/gitsigns.nvim",
{
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" }}


}

local opts = {}

require("lazy").setup(plugins, opts)
