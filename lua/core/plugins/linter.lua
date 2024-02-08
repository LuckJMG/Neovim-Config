return {
	'mfussenegger/nvim-lint',
	config = function()
		local linter = require('lint')
		linter.linters_by_ft = {
			python = { 'pylint' },
			bash = { 'shellcheck' },
			javascript = { 'oxlint' },
			typescript = { 'oxlint' },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				linter.try_lint()
			end,
		})
	end,
}
