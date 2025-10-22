-- Navigation
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', 'H', '^')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')
vim.keymap.set('v', 'L', '$')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', '<A-j>', 'G')
vim.keymap.set('n', '<A-k>', 'gg')

-- Mantain selection on indent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Disable keymaps
vim.keymap.set('n', 'q', '<Nop>')
vim.keymap.set('n', '<F1>', '<Nop>')

-- Center find
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Clipboard
vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set('n', '<C-v>', '"+p')
vim.keymap.set('v', '<C-v>', '"+p')
vim.keymap.set('i', '<C-v>', '<C-r><C-o>+')
vim.keymap.set('c', '<C-v>', '<C-r>+')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<leader>ya', 'gg"+yG') -- Copy all file to system

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '<leader>dn', function()
			vim.diagnostic.jump({ count = 1 })
		end, opts)
		vim.keymap.set('n', '<leader>dp', function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
	end
})

