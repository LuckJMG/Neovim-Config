return {
	{
		'Mofiqul/dracula.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('dracula').setup({ show_end_of_buffer = true })
			vim.cmd('colorscheme dracula')
			vim.cmd('highlight whitespace guifg=#3B4048 gui=nocombine')
			vim.cmd('highlight cursorline guibg=#21222C gui=nocombine')
			vim.cmd('highlight colorcolumn guibg=#191A21 gui=nocombine')
		end,
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
	{ 'nvim-treesitter/nvim-treesitter-context' },
	{
		'windwp/nvim-ts-autotag',
		opts = {}
	}
}
