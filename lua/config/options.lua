-- Basic
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

-- Visual
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "101"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.completeopt = "menuone,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.ruler = false
vim.opt.fillchars = "eob: "
vim.opt.list = true
vim.opt.listchars = {
	tab = "| ",
	leadmultispace = "|   ",
	trail = "·",
	nbsp = "¬",
}
vim.opt.winborder = "rounded"

-- File Handling
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Behavior Settings
vim.opt.iskeyword:append("-")
vim.opt.shortmess:append("WcC")
vim.opt.mouse = ""
vim.opt.confirm = true
vim.opt.formatoptions = "qjl1"

-- Diagnostics
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	update_in_insert = false,
	signs = {
		text = {
			ERROR = "󰅚 ",
			WARN = "󰀪 ",
			HINT = "󰌶 ",
			INFO = " ",
		},
	},
})
