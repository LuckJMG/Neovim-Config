return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			skip_confirm_for_simple_edits = true,
			float = { border = "rounded" },
			confirmation = { border = "rounded" },
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					if name:sub(-#"-lock.json") == "-lock.json" then
						return true
					end

					local always_hidden = { "..", ".git" }
					for _, value in ipairs(always_hidden) do
						if value == name then
							return true
						end
					end

					return false
				end,
			},
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
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]eymaps" },
			{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[/] Search in current buffer" },
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
					desc = "[M]ark buffer",
				},
				{
					"<leader>M",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "[M]arked buffers list",
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
					desc = "Harpoon to file [" .. i .. "]",
				})
			end

			return keys
		end,
	},
}
