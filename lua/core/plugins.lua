-- Setup lazy.nvim
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

-- Plugins
require('lazy').setup({
	"williamboman/mason.nvim",

	-- UI
	'Mofiqul/dracula.nvim',
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	},
	"lukas-reineke/indent-blankline.nvim",

	--- Icons
	'nvim-tree/nvim-web-devicons',
	"onsails/lspkind.nvim",

	-- LSP
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	-- CMP
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	{ "folke/neodev.nvim", opts = {} }, -- neovim api

	--- Snippets
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = "make install_jsregexp"
	},
	'saadparwaiz1/cmp_luasnip',

	-- Linter
	'mfussenegger/nvim-lint',

	-- Navigation
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Code
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
})

require("mason").setup()

