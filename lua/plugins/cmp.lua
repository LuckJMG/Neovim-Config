return {
	"saghen/blink.cmp",
	version = "1.*",
	opts_extend = { "sources.default" },
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "folke/lazydev.nvim", ft = "lua" },
	},
	event = { "InsertEnter", "CmdlineEnter" },

	---@module 'blink.cmp'
	---@diagnostic disable-next-line: undefined-doc-name
	---@type blink.cmp.Config
	opts = {
		appearance = { nerd_font_variant = "mono" },
		completion = {
			accept = { auto_brackets = { enabled = true } },
			menu = { draw = { treesitter = { "lsp" } } },
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					fallbacks = { "lsp" },
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		cmdline = {
			enabled = true,
			keymap = {
				preset = "cmdline",
				["<Right>"] = false,
				["<Left>"] = false,
			},
			completion = {
				list = { selection = { preselect = false } },
				menu = {
					auto_show = function(_)
						return vim.fn.getcmdtype() == ":"
					end,
				},
				ghost_text = { enabled = true },
			},
		},
		keymap = { preset = "default" },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
