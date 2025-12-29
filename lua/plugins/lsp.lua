return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
				signs = {
					text = {
						ERROR = "󰅚 ",
						WARN = "󰀪 ",
						HINT = "󰌶 ",
						INFO = " ",
					},
				},
			},
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							completion = { callSnippet = "Replace" },
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
				bashls = {},
			},
		},
		config = function(_, opts)
			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			require("mason").setup()
			local mason_lsp = require("mason-lspconfig")

			mason_lsp.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
				automatic_installation = true,
				automatic_enable = false,
			})

			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				vim.lsp.config(server, config)
			end
		end,
	},
}
