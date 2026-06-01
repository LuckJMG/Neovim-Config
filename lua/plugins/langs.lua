local langs = {
	python = {
		lsp = "ruff",
		formatter = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	},

	-- Config/Docs
	lua = {
		lsp = "lua_ls",
		formatter = { "stylua" },
	},
	json = {
		lsp = "",
		formatter = { "oxfmt" },
	},
	markdown = {
		lsp = "",
		formatter = { "oxfmt" },
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
		lsp = "svelte",
		formatter = { "prettierd" },
	},
}

-- Setup LSP
vim.pack.add({ "https://github.com/mason-org/mason.nvim", "https://github.com/neovim/nvim-lspconfig" })
require("mason").setup()
vim.lsp.enable("tailwindcss")

-- Main configuration loop
local lang_list = {}
local formatters = {}
for lang, config in pairs(langs) do
	table.insert(lang_list, lang)

	if config.lsp ~= "" then
		vim.lsp.enable(config.lsp)
	end

	formatters[lang] = config.formatter
end

-- Setup treesitter
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

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
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	notify_on_error = false,
	formatters_by_ft = formatters,
	default_format_opts = { lsp_format = "fallback" },
	format_on_save = { timeout_ms = 500 },
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[C]ode [F]ormat" })
