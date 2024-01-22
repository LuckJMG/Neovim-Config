-- Navigation
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.cmd('map H ^')
vim.cmd('map J <C-d>zz')
vim.cmd('map K <C-u>zz')
vim.cmd('map L $')
vim.cmd('map <A-j> G')
vim.cmd('map <A-k> gg')

-- Disable keymaps
vim.cmd('map q <Nop>')
vim.cmd('map <F1> <Nop>')

-- Clipboard
vim.keymap.set("v", "<C-C>", '"*y')
vim.cmd('map <C-V> "*p')
vim.cmd('imap <C-V> "*p')
vim.cmd('map U <C-r>')

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

		vim.keymap.set('n', '<leader>di', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
		vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
		vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	end
})

