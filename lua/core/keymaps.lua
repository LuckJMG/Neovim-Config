vim.g.mapleader = " "

-- Navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

vim.keymap.set("v", "<C-y>", '"*y')
vim.keymap.set({'n', 'i', 'v'}, "<C-p>", '"*p')

