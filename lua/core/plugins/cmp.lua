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
			max_width = 50,
			ellipsis_char = '...',
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
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping.select_prev_item(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp', priority = 1000 },
				{ name = 'luasnip', priority = 750 },
				{ name = 'nvim_lsp_signature_help', priority = 500 },
				{ name = 'path', priority = 250 },
			}, {
				{ name = 'buffer', keyword_length = 3 },
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

		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		cmp.event:on(
			'confirm_done',
			cmp_autopairs.on_confirm_done()
		)
	end,
}

