return {
	{
		"Mofiqul/dracula.nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function ()
			vim.cmd.colorscheme('dracula')
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			theme = 'dracula-nvim',
		},
	},
	{
		'williamboman/mason.nvim',
		priority = 100,
		opts = {},
	},
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = "make install_jsregexp"
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		dependencies = { 'nvim-treesitter/nvim-treesitter' }
	},
	{
		'windwp/nvim-ts-autotag',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {}
	}
}
