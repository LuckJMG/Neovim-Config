-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Check for File Changes
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = vim.api.nvim_create_augroup("checktime", { clear = true }),
	callback = function()
		if vim.opt.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Wrap & Spell
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
	callback = function()
		if vim.tbl_contains({ "gitcommit", "markdown", "text", "plaintext" }, vim.bo.filetype) then
			vim.opt_local.wrap = true
			vim.opt_local.linebreak = true
			vim.opt_local.spell = true
		end
	end,
})

-- Close info windows
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<CMD>close<CR>", { buffer = event.buf, silent = true })
	end,
})

-- Restore cursor
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Disable auto comment on new line
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("no_comment_on_newline", { clear = true }),
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local code = vim.lsp.buf
		local function map(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<LEADER>cD", code.declaration, "[C]ode [D]eclaration")
		map("<LEADER>ca", code.code_action, "[C]ode [A]ction")
		map("<LEADER>cr", code.rename, "[C]ode [R]ename")
		map("<F2>", code.rename, "[C]ode [R]ename")
		map("<LEADER>d", vim.diagnostic.open_float, "[D]iagnostic")
	end,
})
