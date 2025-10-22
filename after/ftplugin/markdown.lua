vim.api.nvim_create_autocmd('FileType', {
	pattern = 'markdown',
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.colorcolumn = ""
		vim.opt_local.conceallevel = 2
		vim.opt_local.spell = true
		vim.opt_local.spelllang = 'es,en'

		vim.keymap.set('n', 'j', 'gj', { buffer = true })
		vim.keymap.set('n', 'k', 'gk', { buffer = true })
	end,
})
