return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind.nvim',
	},
	config = function()
		local cmp = require('cmp')
		local format = require('lspkind').cmp_format({
			mode = 'symbol',
			menu = {}
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping.confirm({select = false}),
				['<C-Space>'] = cmp.mapping.complete(),
				['<Tab>'] = cmp.mapping.select_next_item(),
				['<S-Tab>'] = cmp.mapping.select_prev_item(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'nvim_lua' },
				{ name = 'luasnip' },
				{ name = 'path' },
			}, {
				{ name = 'buffer' },
			}),
			formatting = {
				format = format,
			},
		})

		-- Use buffer source for `/` and `?`
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			},
			formatting = {
				format = format,
			},
		})

		-- Use cmdline & path source for ':'
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			}),
			formatting = {
				format = format,
			},
		})
	end,
}

