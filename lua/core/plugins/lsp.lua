local lsp = {}

local lua_lsp = {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

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
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		require('lspconfig').lua_ls.setup(lua_lsp)
		require('lspconfig').bashls.setup({ capabilities = capabilities })
		require('lspconfig').rust_analyzer.setup({ capabilities = capabilities })
		require('lspconfig').clangd.setup({ capabilities = capabilities })
		require('lspconfig').pyright.setup({ capabilities = capabilities })
		require('lspconfig').marksman.setup({ capabilities = capabilities })

		-- WebDev
		require('lspconfig').html.setup({ capabilities = capabilities })
		require('lspconfig').cssls.setup({ capabilities = capabilities })
		require('lspconfig').tsserver.setup({ capabilities = capabilities })
	end,
})

return lsp
