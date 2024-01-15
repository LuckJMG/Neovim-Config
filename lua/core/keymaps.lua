vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Disable keymaps
vim.cmd('map q <Nop>')
vim.cmd('nmap <F1> <Nop>')

-- Clipboard
vim.keymap.set("v", "<C-C>", '"*y')
vim.keymap.set("n", "<C-V>", '"*p')

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

		vim.keymap.set('n', '<leader>di', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
		vim.keymap.set('n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
		vim.keymap.set('n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	end
})

