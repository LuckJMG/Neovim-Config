vim.g.mapleader = ' '
vim.opt.mouse = ''
vim.opt.updatetime = 300
vim.opt.incsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.hlsearch = false
vim.g.netrw_banner = 0

-- File
vim.opt.fixeol = true
vim.opt.undofile = true

-- Lines
vim.opt.signcolumn = 'yes'
vim.opt.foldcolumn = '1'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "81"
vim.opt.list = true
vim.opt.listchars:append "tab:| ,leadmultispace:|   ,trail:⋅"

-- Identation (always tab 4)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.autoindent = true

-- Completion
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

-- Clipboard
vim.g.clipboard = {
    name = "xclip",
    copy = {
        ["+"] = 'xclip -selection clipboard',
        ["*"] = 'xclip -selection primary',
    },
    paste = {
        ["+"] = 'xclip -selection clipboard -o',
        ["*"] = 'xclip -selection primary -o',
    },
    cache_enabled = 1,
}

