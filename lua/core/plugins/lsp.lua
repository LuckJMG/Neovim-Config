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

vim.lsp.config('basedpyright', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config('clangd', {
	capabilities = vim.tbl_deep_extend(
		'force',
		require('cmp_nvim_lsp').default_capabilities(),
		{ offsetEncoding = { "utf-16" } }  -- evita el error de encoding
	),
})

-- WebDev
vim.lsp.config('ts_ls', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})

vim.lsp.config('tailwindcss', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config('html', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config('cssls', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Docker
vim.lsp.config('dockerls', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config('docker_compose_language_service', {
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
})

return lsp
