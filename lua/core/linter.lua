--# selene: allow(undefined_variable)
--# selene: allow(unscoped_variables)
-- Identation (always tab 4)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.autoindent = true

-- Linter
require('lint').linters_by_ft = {
	lua = {'selene',}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

