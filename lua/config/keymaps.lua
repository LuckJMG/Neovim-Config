local map = vim.keymap.set

-- Movement
map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true, desc = "Visual down" })
map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true, desc = "Visual up" })
map({ "n", "x", "o" }, "H", "^", { desc = "Go to start of line" })
map({ "n", "x", "o" }, "L", "$", { desc = "Go to end of line" })

-- Scroll
map("n", "<C-d>", "<C-d>zz", { desc = "Centered down scroll" })
map("n", "<C-u>", "<C-u>zz", { desc = "Centered up scroll" })
map("n", "N", "Nzzzv", { desc = "Centered previous result" })
map("n", "n", "nzzzv", { desc = "Centered next result" })

-- Selection
map("x", "<", "<gv", { desc = "Indent left maintaining selection" })
map("x", ">", ">gv", { desc = "Indent right maintaining selection" })

-- Clipboard
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
map("x", "gp", '"+P', { desc = "Paste from system clipboard" })
map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gyab", function()
	local filepath = vim.fn.expand("%")
	local filetype = vim.bo.filetype
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n")
	local formatted_text = string.format("-- %s\n```%s\n%s\n```\n\n", filepath, filetype, content)

	vim.fn.setreg("+", formatted_text)
	vim.notify(string.format("File %s copied as markdown", filepath), vim.log.levels.INFO)
end, { desc = "Copy file as markdown" })

-- File
map("n", "<C-S>", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })
map("n", "U", "<C-r>", { desc = "Redo" })
map({ "i", "x" }, "<C-S>", "<Esc><Cmd>silent! update | redraw<CR>", { desc = "Save and go to Normal mode" })

-- Deactivation
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear hlsearch" })
map("n", "<F1>", "<Nop>", { desc = "Deactivate Help" })
map("n", "Q", "<Nop>", { desc = "Deactivate Ex mode" })
map("n", "q", "<Nop>", { desc = "Deactivate Macros" })
