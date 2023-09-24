-- General Settings
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.hlsearch = false

--- Lines
vim.opt.signcolumn = 'yes'
vim.opt.foldcolumn = '1'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 5

-- Theme (dracula always)
require("dracula").setup({
	show_end_of_buffer = true,
	transparent_bg = true,
})

vim.cmd [[colorscheme dracula]]

-- Treesitter
require('nvim-treesitter.configs').setup {
	-- A list of parser names, or "all"
	ensure_installed = { "lua", "vimdoc", "rust", "python", "cpp", "bash"},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		enable = true,
	},
}

-- Lualine
require('lualine').setup({})

-- Indent Blankline
require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = true,
})

