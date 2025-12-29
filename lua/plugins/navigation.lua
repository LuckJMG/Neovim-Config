return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			float = { border = "rounded" },
			confirmation = { border = "rounded" },
		},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
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
			{ "<leader>fp", "<cmd>Telescope find_files<cr>", desc = "Find Project files" },
			{ "<leader>sp", "<cmd>Telescope live_grep<cr>", desc = "Search Project strings" },
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
		opts = {
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		},
		keys = function()
			local harpoon = require("harpoon")
			local keys = {
				{
					"<leader>mb",
					function()
						harpoon:list():add()
					end,
					desc = "Mark Buffer",
				},
				{
					"<leader>lb",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "List Buffers",
				},
				{
					"<C-n>",
					function()
						harpoon:list():next({ ui_nav_wrap = true })
					end,
					desc = "Harpoon to next file",
				},
				{
					"<C-p>",
					function()
						harpoon:list():prev({ ui_nav_wrap = true })
					end,
					desc = "Harpoon to prev file",
				},
			}

			for i = 1, 9 do
				table.insert(keys, {
					"<leader>" .. i,
					function()
						harpoon:list():select(i)
					end,
					desc = "Harpoon to file " .. i,
				})
			end

			return keys
		end,
	},
}
