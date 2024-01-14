return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<leader>pf', '<cmd>Telescope find_files<cr>' },
		{ '<leader>pg', '<cmd>Telescope live_grep<cr>' },
		{ '<leader>gf', '<cmd>Telescope git_files<cr>' },
	}
}
