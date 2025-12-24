local map = vim.keymap.set

-- Movement
map({ "n", "x" }, "k", "gk", { desc = "Visual up" })
map({ "n", "x" }, "j", "gj", { desc = "Visual down" })
map({ "n", "x", "o" }, "H", "^", { desc = "Go to start of line" })
map({ "n", "x", "o" }, "L", "$", { desc = "Go to end of line" })

-- Scroll
map("n", "<C-u>", "<C-u>zz", { desc = "Centered up scroll" })
map("n", "<C-d>", "<C-d>zz", { desc = "Centered down scroll" })
map("n", "n", "nzzzv", { desc = "Centered next result" })
map("n", "N", "Nzzzv", { desc = "Centered previous result" })

-- Selection
map("x", "<", "<gv", { desc = "Indent left maintaining selection" })
map("x", ">", ">gv", { desc = "Indent right maintaining selection" })

-- Clipboard
map({ "n", "x" }, "<leader>y", [["+y]], { desc = "Copy to system" })
map("n", "<leader>p", [[l"+P]], { desc = "Paste from system" })
map("x", "<leader>p", [["_d"+P]], { desc = "Paste from system" })

-- Utilities
map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear hlsearch" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>ya", function()
	local filepath = vim.fn.expand("%")
	local filetype = vim.bo.filetype
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n")
	local formatted_text = string.format("-- %s\n```%s\n%s\n```\n\n", filepath, filetype, content)

	vim.fn.setreg("+", formatted_text)
	vim.notify(string.format("File %s copied to clipboard", filepath), vim.log.levels.INFO)
end, { desc = "Copy file as markdown" })

-- Deactivation
map("n", "q", "<Nop>", { desc = "Deactivate Macros" })
map("n", "<F1>", "<Nop>", { desc = "Deactivate Help" })
map("n", "Q", "<Nop>", { desc = "Deactivate Ex mode" })
