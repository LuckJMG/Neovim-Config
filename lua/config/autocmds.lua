local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight Yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Check for File Changes
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Wrap & Spell
autocmd("BufEnter", {
	group = augroup("wrap_spell"),
	callback = function()
		if vim.tbl_contains({ "gitcommit", "markdown", "text", "plaintext" }, vim.bo.filetype) then
			vim.opt_local.wrap = true
			vim.opt_local.linebreak = true
			vim.opt_local.spell = true
		end
	end,
})

-- Close info windows
autocmd("FileType", {
	group = augroup("close_with_q"),
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

-- LSP
autocmd("LspAttach", {
	group = augroup("UserLspConfig"),
	callback = function(event)
		local function map(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Navegation
		map("gd", vim.lsp.buf.definition, "Go to Definition")
		map("gD", vim.lsp.buf.declaration, "Go to Declaration")
		map("gr", vim.lsp.buf.references, "Go to References")
		map("gI", vim.lsp.buf.implementation, "Go to Implementation")

		-- Information and Help
		map("<leader>k", vim.lsp.buf.hover, "Hover Documentation")
		map("<leader>K", vim.lsp.buf.signature_help, "Signature Help")

		-- Actions
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("<F2>", vim.lsp.buf.rename, "Rename Symbol")

		-- Diagnostics
		map("<leader>di", vim.diagnostic.open_float, "Show Line Diagnostics")
		map("<leader>dn", function()
			vim.diagnostic.jump({ count = 1 })
		end, "Next Diagnostic")
		map("<leader>dp", function()
			vim.diagnostic.jump({ count = -1 })
		end, "Prev Diagnostic")
	end,
})

-- Restore cursor
autocmd("BufReadPost", {
	group = augroup("last_loc"),
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
autocmd("BufEnter", {
	group = augroup("no_comment_on_newline"),
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
