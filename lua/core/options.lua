vim.g.mapleader = ' '

-- General Settings
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.hlsearch = false
vim.opt.fixeol = true
vim.cmd('set mouse=')

-- Lines
vim.opt.signcolumn = 'yes'
vim.opt.foldcolumn = '1'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.colorcolumn = "81"
vim.opt.list = true
vim.opt.listchars:append "tab:| ,leadmultispace:|   ,trail:⋅"

-- Netrw
vim.cmd('let g:netrw_banner = 0')

-- Undo
vim.opt.undofile = true

-- Identation (always tab 4)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.autoindent = true

-- Completion
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)

-- Clipboard
vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
        ["+"] = 'clip.exe',
        ["*"] = 'clip.exe',
    },
    paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
}

