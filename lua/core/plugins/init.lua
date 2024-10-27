return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({})
			require("everforest").load()
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			theme = 'everforest',
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
	{ 'nvim-treesitter/nvim-treesitter-context' },
	{
		'windwp/nvim-ts-autotag',
		opts = {}
	}
}
