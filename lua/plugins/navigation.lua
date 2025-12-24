return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = { float = { border = "rounded" } },
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		keys = {
			{ "<leader>v", "<cmd>Oil<cr>", desc = "Open project view" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		},
		opts = {
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/", ".venv/" },
				layout_strategy = "horizontal",
				layout_config = {
					height = 0.9,
					width = 0.9,
				},
				sorting_strategy = "ascending",
				prompt_position = "top",
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = function()
			local keys = {
				{
					"<leader>H",
					function()
						require("harpoon"):list():add()
					end,
					desc = "Harpoon file",
				},
				{
					"<leader>h",
					function()
						local harpoon = require("harpoon")
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "Harpoon quick menu",
				},
				{
					"<leader>n",
					function()
						require("harpoon"):list():next()
					end,
					desc = "Harpoon to next file",
				},
				{
					"<leader>p",
					function()
						require("harpoon"):list():prev()
					end,
					desc = "Harpoon to prev file",
				},
			}

			for i = 1, 9 do
				table.insert(keys, {
					"<leader>" .. i,
					function()
						require("harpoon"):list():select(i)
					end,
					desc = "Harpoon to file " .. i,
				})
			end

			return keys
		end,
	},
}
