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
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		opts = {
			diagnostics = {
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				update_in_insert = false,
				virtual_text = {
					spacing = 2,
					source = "if_many",
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
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
				basedpyright = {},
			},
		},
		config = function(_, opts)
			local autocmd = vim.api.nvim_create_autocmd
			local augroup = vim.api.nvim_create_augroup

			autocmd("LspAttach", {
				group = augroup("UserLspConfig", { clear = true }),
				callback = function(event)
					local function map(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("<leader>cD", vim.lsp.buf.declaration, "[C]ode [D]eclaration")
					map("<leader>cR", vim.lsp.buf.references, "[C]ode [R]eferences")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("<leader>cd", vim.diagnostic.open_float, "[C]ode [D]iagnostic")
					map("<leader>cd", vim.lsp.buf.definition, "[C]ode [D]efinition")
					map("<leader>ci", vim.lsp.buf.implementation, "[C]ode [I]mplementation")
					map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")

					map("<leader>k", vim.lsp.buf.signature_help, "Show Signature")
				end,
			})

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
				vim.lsp.enable(server)
			end
		end,
	},
}
