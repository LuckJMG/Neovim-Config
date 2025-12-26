local global, options = vim.g, vim.o

-- General Settings
global.mapleader = " "
options.mouse = ""
options.confirm = true
options.updatetime = 300

-- Backup & Undo
options.undofile = true
options.swapfile = false
options.backup = false
options.writebackup = false

-- UI & Appearance
options.termguicolors = true
options.showmode = false
options.number = true
options.relativenumber = true
options.signcolumn = "yes"
options.ruler = false
options.cursorline = true
options.colorcolumn = "81"
options.fillchars = "eob: "

-- List Chars
options.list = true
vim.opt.listchars = {
	tab = "| ",
	leadmultispace = "|   ",
	trail = "⋅",
	nbsp = "␣",
}

-- Window & Buffer Handling
options.wrap = false
options.linebreak = true
options.breakindent = true
options.scrolloff = 10
options.foldcolumn = "1"
vim.opt.shortmess:append("WcC")

-- Indentation
options.tabstop = 4
options.shiftwidth = 4
options.softtabstop = 4
options.expandtab = false
options.autoindent = true
options.smartindent = true

-- Search & Editing
options.ignorecase = true
options.smartcase = true
options.infercase = true
options.incsearch = true
options.completeopt = "menuone,noselect"
options.formatoptions = "qjl1"

-- Clipboard
if vim.fn.has("wsl") == 1 then
	global.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
else
	global.clipboard = {
		name = "xclip",
		copy = {
			["+"] = "xclip -selection clipboard",
			["*"] = "xclip -selection primary",
		},
		paste = {
			["+"] = "xclip -selection clipboard -o",
			["*"] = "xclip -selection primary -o",
		},
		cache_enabled = 1,
	}
end
