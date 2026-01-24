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
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		keys = {
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search Files" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search current Word" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps" },
			{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in current buffer" },
		},
		opts = {
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/", ".venv/" },
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_cursor({}),
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, require("telescope.themes").get_dropdown({}))
			telescope.setup(opts)

			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "ui-select")
		end,
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
					"<leader>m",
					function()
						harpoon:list():add()
					end,
					desc = "Mark Buffer",
				},
				{
					"<leader>M",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "Marked Buffer List",
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
