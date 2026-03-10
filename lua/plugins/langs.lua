local langs = {
	lua = {
		lsp = "lua_ls",
		formatter = { "stylua" },
	},

	-- C/C++
	c = {
		lsp = "clangd",
		formatter = { "clang_format" },
	},
	cpp = {
		lsp = "clangd",
		formatter = { "clang_format" },
	},

	-- WebDev
	html = {
		lsp = "html-lsp",
		formatter = { "oxfmt" },
	},
	css = {
		lsp = "css-lsp",
		formatter = { "oxfmt" },
	},
	javascript = {
		lsp = "vtsls",
		formatter = { "oxfmt" },
	},
	typescript = {
		lsp = "vtsls",
		formatter = { "oxfmt" },
	},
	svelte = {
		lsp = "svelte-language-server",
		formatter = { "prettierd" },
	},
	python = {
		lsp = "ruff",
		formatter = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	},
}

-- Setup LSP
MiniDeps.add({
	source = "neovim/nvim-lspconfig",
	depends = { "mason-org/mason.nvim" },
})
require("mason").setup()

-- Main configuration loop
local lang_list = {}
local formatters = {}
for lang, config in pairs(langs) do
	table.insert(lang_list, lang)
	vim.lsp.enable(config.lsp)
	formatters[lang] = config.formatter
end

-- Setup treesitter
MiniDeps.add("nvim-treesitter/nvim-treesitter")

local TreeSitter = require("nvim-treesitter")
TreeSitter.setup()

TreeSitter.install(lang_list)
vim.api.nvim_create_autocmd("FileType", {
	pattern = lang_list,
	callback = function()
		vim.treesitter.start()
	end,
})

-- Setup formatters
MiniDeps.add("stevearc/conform.nvim")

require("conform").setup({
	notify_on_error = false,
	formatters_by_ft = formatters,
	default_format_opts = { lsp_format = "fallback" },
	format_on_save = { timeout_ms = 500 },
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[C]ode [F]ormat" })
