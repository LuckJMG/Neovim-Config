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
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
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

		map("<leader>cD", code.declaration, "[C]ode [D]eclaration")
		map("<leader>ca", code.code_action, "[C]ode [A]ction")
		map("<leader>cr", code.rename, "[C]ode [R]ename")
		map("<F2>", code.rename, "[C]ode [R]ename")
		map("<leader>d", vim.diagnostic.open_float, "[D]iagnostic")
	end,
})

-- Automatic Indent
local function guess_indent()
	local lines = vim.api.nvim_buf_get_lines(0, 0, 100, false)

	-- Counts
	local tabs = 0
	local space_diffs = { [2] = 0, [4] = 0, [8] = 0 }
	local prev_indent = 0

	for _, line in ipairs(lines) do
		if line:match("^%s*$") then
			goto continue
		end

		local leading_whitespace = line:match("^%s*")

		if leading_whitespace:match("\t") then
			tabs = tabs + 1
		else
			local curr_indent = #leading_whitespace
			local diff = math.abs(curr_indent - prev_indent)

			if diff > 0 and space_diffs[diff] ~= nil then
				space_diffs[diff] = space_diffs[diff] + 1
			end
			prev_indent = curr_indent
		end

		::continue::
	end

	-- Results
	local sum_space_diffs = 0
	local best_width = 4
	local max_count = -1

	for width, count in pairs(space_diffs) do
		sum_space_diffs = sum_space_diffs + count
		if count > max_count then
			max_count = count
			best_width = width
		end
	end

	-- Space indentation
	if sum_space_diffs > 0 then
		vim.bo.expandtab = true
		vim.bo.shiftwidth = best_width
		vim.bo.tabstop = best_width

		local listchars = vim.opt.listchars:get()
		listchars.leadmultispace = "|" .. string.rep(" ", best_width - 1)
		vim.opt_local.listchars = listchars
	end
end

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("AutomaticIndent", { clear = true }),
	pattern = "*",
	callback = guess_indent,
})
