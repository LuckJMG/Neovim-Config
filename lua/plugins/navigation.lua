-- Oil
MiniDeps.add({
	source = "stevearc/oil.nvim",
	depends = { "nvim-mini/mini.icons" },
})

require("oil").setup({
	skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope
MiniDeps.add({
	source = "nvim-telescope/telescope.nvim",
	depends = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
})

local Telescope = require("telescope")
Telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules", ".git/", ".venv/" },
	},
	pickers = {
		find_files = {
			previewer = false,
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		help_tags = {
			theme = "dropdown",
		},
		keymaps = {
			theme = "dropdown",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_cursor({}),
		},
	},
})

pcall(Telescope.load_extension, "fzf")
pcall(Telescope.load_extension, "ui-select")

vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "[S]earch [K]eymaps" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("TelescopeLspConfig", { clear = true }),
	callback = function(event)
		local telescope = require("telescope.builtin")
		local function map(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<leader>cR", telescope.lsp_references, "[C]ode [R]eferences")
		map("<leader>cd", telescope.lsp_definitions, "[C]ode [D]efinition")
		map("<leader>ci", telescope.lsp_implementations, "[C]ode [I]mplementation")
		map("<leader>ct", telescope.lsp_type_definitions, "[C]ode [T]ype Definition")
	end,
})

-- Harpoon
MiniDeps.add({ source = "ThePrimeagen/harpoon", checkout = "harpoon2", depends = { "nvim-lua/plenary.nvim" } })

local Harpoon = require("harpoon")
Harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
})

vim.keymap.set("n", "<leader>m", function()
	Harpoon:list():add()
end, { desc = "[M]ark buffer" })
vim.keymap.set("n", "<leader>M", function()
	Harpoon.ui:toggle_quick_menu(Harpoon:list())
end, { desc = "[M]arked buffers list" })
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		Harpoon:list():select(i)
	end, { desc = "Harpoon to file [" .. i .. "]" })
end

local function harpoon_component()
	local list = Harpoon:list()
	local length = list:length()

	if length == 0 then
		return ""
	end

	local marks = {}
	for i = 1, length do
		local item = list:get(i)

		if item ~= nil and item.value ~= nil and item.value ~= "" then
			local filename = vim.fn.fnamemodify(item.value, ":t")
			table.insert(marks, string.format("%d %s", i, filename))
		end
	end

	if #marks == 0 then
		return ""
	end

	return table.concat(marks, " | ")
end

require("lualine").setup({ sections = { lualine_c = { harpoon_component } } })
