-- Setup rust language
require('lspconfig').rust_analyzer.setup({
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

