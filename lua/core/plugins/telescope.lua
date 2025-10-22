return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	keys = {
		{ '<leader>pf', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
		{ '<leader>pg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
		{ '<leader>gf', '<cmd>Telescope git_files<cr>', desc = 'Git Files' },
		{ '<leader>pb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
		{ '<leader>ps', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Symbols' },
	},
	opts = {
		defaults = {
			file_ignore_patterns = { 'node_modules', '.git/', '.venv/' },
			layout_strategy = 'horizontal',
			layout_config = {
				height = 0.9,
				width = 0.9,
			},
			sorting_strategy = 'ascending',
			prompt_position = 'top',
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},
}
