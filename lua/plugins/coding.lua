return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				lua = { "luacheck" },
				python = { "ruff" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				svelte = { "eslint_d" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
				group = vim.api.nvim_create_augroup("lint", { clear = true }),
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[C]ode [F]ormat",
			},
		},
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			notify_on_error = false,
			formatters_by_ft = {
				bash = { "shfmt" },
				css = { "prettierd" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				json = { "prettierd" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				sh = { "shfmt" },
				svelte = { "prettierd" },
				typescript = { "prettierd" },
			},
			default_format_opts = { lsp_format = "fallback" },
			format_on_save = { timeout_ms = 500 },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>g", "<cmd>LazyGit<cr>", desc = "[G]it" },
		},
	},
	{ "NMAC427/guess-indent.nvim", opts = {} },
	{ "nvim-mini/mini.pairs", version = false, opts = {} },
	{ "nvim-mini/mini.splitjoin", version = false, opts = {} },
	{ "nvim-mini/mini.operators", version = false, opts = {} },
	{ "nvim-mini/mini.comment", version = false, opts = {} },
	{ "nvim-mini/mini.surround", version = false, opts = {} },
}
