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
		opts = {
			mappings = {
				inside_last = "",
				around_last = "",
			},
			custom_textobjects = {
				-- Whole Buffer
				b = function()
					local from = { line = 1, col = 1 }
					local to = {
						line = vim.fn.line("$"),
						col = math.max(vim.fn.getline("$"):len(), 1),
					}
					return { from = from, to = to }
				end,

				-- Line Content
				l = function()
					local line_num = vim.fn.line(".")
					local line_val = vim.fn.getline(line_num)

					local start_col = line_val:find("%S")
					if not start_col then
						return nil
					end

					local _, end_col = line_val:find(".*%S")

					return {
						from = { line = line_num, col = start_col },
						to = { line = line_num, col = end_col },
					}
				end,
			},
		},
	},
}
