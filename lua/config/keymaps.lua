vim.g.mapleader = " "

-- Movement
vim.keymap.set({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true, desc = "Visual down" })
vim.keymap.set({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true, desc = "Visual up" })

-- Scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Centered down scroll" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Centered up scroll" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Centered previous result" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Centered next result" })

-- Selection
vim.keymap.set("x", "<", "<gv", { desc = "Indent left maintaining selection" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right maintaining selection" })

-- Clipboard
vim.keymap.set("n", "gp", '"+p', { desc = "[P]aste from system" })
vim.keymap.set("x", "gp", '"+P', { desc = "[P]aste from system" })
vim.keymap.set({ "n", "x" }, "gy", '"+y', { desc = "[Y]ank to system" })
vim.keymap.set("n", "gyaB", function()
	local filepath = vim.fn.expand("%")
	local filetype = vim.bo.filetype
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n")
	local formatted_text = string.format("-- %s\n```%s\n%s\n```\n\n", filepath, filetype, content)

	vim.fn.setreg("+", formatted_text)
	vim.notify(string.format("File %s copied as markdown", filepath), vim.log.levels.INFO)
end, { desc = "[Y]ank [a]round [B]uffer" })

-- File
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<C-S>", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })
vim.keymap.set({ "i", "x" }, "<C-S>", "<Esc><Cmd>silent! update | redraw<CR>", { desc = "Save and go to Normal mode" })

-- Deactivation
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear hlsearch" })
vim.keymap.set("n", "<F1>", "<Nop>", { desc = "Deactivate Help" })
vim.keymap.set("n", "Q", "<Nop>", { desc = "Deactivate Ex mode" })
vim.keymap.set("n", "q", "<Nop>", { desc = "Deactivate Macros" })
