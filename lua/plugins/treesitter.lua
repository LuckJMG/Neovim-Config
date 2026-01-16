return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		dependencies = {
			{ "windwp/nvim-ts-autotag", opts = {} },
		},
		opts_extend = { "ensure_installed" },
		opts = {
			indent = { enable = true },
			highlight = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			auto_install = true,
			incremental_selection = { enable = true },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			mode = "cursor",
			max_lines = 3,
		},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"nvim-mini/mini.ai",
		version = false,
		dependencies = {
			{ "nvim-mini/mini.extra", version = false, opts = {} },
		},
		config = function()
			local gen_ai_spec = require("mini.extra").gen_ai_spec
			require("mini.ai").setup({
				custom_textobjects = {
					B = gen_ai_spec.buffer(),
					D = gen_ai_spec.diagnostic(),
					I = gen_ai_spec.indent(),
					L = gen_ai_spec.line(),
					N = gen_ai_spec.number(),
				},
			})
		end,
	},
}
