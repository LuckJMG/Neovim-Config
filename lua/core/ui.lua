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
vim.opt.colorcolumn = "81"
vim.opt.list = true
vim.opt.listchars:append "tab:| ,leadmultispace:⋅,trail:⋅"

-- Theme (dracula always)
require("dracula").setup({
	show_end_of_buffer = true,
})

vim.cmd [[colorscheme dracula]]
vim.cmd [[highlight whitespace guifg=#3B4048 gui=nocombine]]
vim.cmd [[highlight cursorline guibg=#21222C gui=nocombine]]
vim.cmd [[highlight colorcolumn guibg=#191A21 gui=nocombine]]

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
require('lualine').setup()

