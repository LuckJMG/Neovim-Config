return {
	'mfussenegger/nvim-lint',
	config = function()
		local linter = require('lint')
		linter.linters_by_ft = {
			python = { 'ruff' }
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
			callback = function()
				linter.try_lint()
			end,
		})
	end,
}
