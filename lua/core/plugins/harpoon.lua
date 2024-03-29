return {
	'ThePrimeagen/harpoon',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')

		vim.keymap.set('n', '<leader>m', mark.add_file)
		vim.keymap.set('n', '<leader>pm', ui.toggle_quick_menu)

		vim.keymap.set('n', '<C-n>', function() ui.nav_next() end)
		vim.keymap.set('n', '<C-p>', function() ui.nav_prev() end)
	end,
}
