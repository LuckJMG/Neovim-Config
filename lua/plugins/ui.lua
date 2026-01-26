return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"nvim-mini/mini.icons",
		version = false,
		lazy = false,
		config = function()
			local icons = require("mini.icons")
			icons.setup()
			icons.mock_nvim_web_devicons()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		event = "VeryLazy",
		opts = {
			options = {
				theme = "everforest",
				component_separators = "",
				section_separators = "",
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		},
		dependencies = { "MunifTanjim/nui.nvim" },
	},
	{
		"jasonpanosso/harpoon-tabline.nvim",
		dependencies = { "ThePrimeagen/harpoon" },
		opts = {},
	},
}
