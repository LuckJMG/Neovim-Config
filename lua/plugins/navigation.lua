return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = { float = { border = "rounded" } },
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		keys = {
			{ "<leader>gp", "<cmd>Oil<cr>", desc = "Go to Project" },
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
		keys = function()
			local keys = {
				{
					"<leader>mb",
					function()
						require("harpoon"):list():add()
					end,
					desc = "Mark Buffer",
				},
				{
					"<leader>lb",
					function()
						local harpoon = require("harpoon")
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "List Buffers",
				},
				{
					"<C-n>",
					function()
						require("harpoon"):list():next()
					end,
					desc = "Harpoon to next file",
				},
				{
					"<C-p>",
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
