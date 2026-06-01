-- Theme
vim.pack.add({ "https://github.com/neanias/everforest-nvim" })
require("everforest").load()
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#272E33" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#272E33" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- Statusline
vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-lualine/lualine.nvim",
})
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

require("lualine").setup({
	options = {
		theme = "auto",
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_b = { "filename" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "diagnostics" },
		lualine_z = { "branch" },
	},
})

-- Better CMD
vim.pack.add({
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/folke/noice.nvim",
})

require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
	views = {
		cmdline_popup = {
			position = {
				row = "39%",
				col = "50%",
			},
		},
		confirm = {
			position = {
				row = "40%",
				col = "50%",
			},
		},
	},
	presets = {
		command_palette = true,
		long_message_to_split = true,
	},
})

vim.api.nvim_set_hl(0, "NoiceMini", { bg = "#414B50" })

-- Indentation
vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })
require("ibl").setup({
	indent = {
		char = "|",
		tab_char = "|",
		priority = 10,
	},
	whitespace = { remove_blankline_trail = false },
	scope = { enabled = false },
})

-- Context
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })
require("treesitter-context").setup({ mode = "cursor", max_lines = 3 })
