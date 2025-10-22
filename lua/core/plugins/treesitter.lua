return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local configs = require('nvim-treesitter.configs')

		configs.setup({
			ensure_installed = { 'vimdoc', 'lua', 'bash', 'markdown', 'markdown_inline', 'json', 'yaml', 'regex' },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<CR>',
					node_incremental = '<CR>',
					node_decremental = '<BS>',
				},
			},
		})
	end,
}
