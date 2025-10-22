local lsp = {}

-- Configuración de lua_ls
vim.lsp.config('lua_ls', {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.git' },
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.config('bashls', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config('gopls', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

table.insert(lsp, {
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
		'williamboman/mason.nvim',
		'neovim/nvim-lspconfig'
	},
	priority = 90,
	opts = {
		ensure_installed = { 'lua_ls', 'bashls' }
	},
})

table.insert(lsp, {
	'neovim/nvim-lspconfig',
	lazy = false,
	priority = 80,
	config = function()
		vim.lsp.enable({'lua_ls', 'bashls', 'gopls'})
	end,
})

return lsp
