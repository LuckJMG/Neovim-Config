-- Oil
vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/malewicz1337/oil-git.nvim",
})

local function parse_output(proc)
	local result = proc:wait()
	local ret = {}
	if result.code == 0 then
		for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
			-- Remove trailing slash
			line = line:gsub("/$", "")
			ret[line] = true
		end
	end
	return ret
end

local function new_git_status()
	return setmetatable({}, {
		__index = function(self, key)
			local ignore_proc = vim.system(
				{ "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
				{
					cwd = key,
					text = true,
				}
			)
			local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
				cwd = key,
				text = true,
			})
			local ret = {
				ignored = parse_output(ignore_proc),
				tracked = parse_output(tracked_proc),
			}

			rawset(self, key, ret)
			return ret
		end,
	})
end
local git_status = new_git_status()

local refresh = require("oil.actions").refresh
local orig_refresh = refresh.callback
refresh.callback = function(...)
	git_status = new_git_status()
	orig_refresh(...)
end

require("oil").setup({
	skip_confirm_for_simple_edits = true,
	view_options = {
		is_hidden_file = function(name, bufnr)
			local dir = require("oil").get_current_dir(bufnr)
			local is_dotfile = vim.startswith(name, ".")
			-- if no local directory (e.g. for ssh connections), just hide dotfiles
			if not dir then
				return is_dotfile
			end
			-- dotfiles are considered hidden unless tracked
			if is_dotfile then
				return not git_status[dir].tracked[name]
			else
				-- Check if file is gitignored
				return git_status[dir].ignored[name]
			end
		end,
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

local Telescope = require("telescope")
local vimgrep_arguments = { table.unpack(require("telescope.config").values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

Telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules", ".git/", ".venv/" },
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
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

vim.keymap.set("n", "<LEADER>sf", "<CMD>Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<LEADER>sg", "<CMD>Telescope live_grep<CR>", { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<LEADER>sh", "<CMD>Telescope help_tags<CR>", { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<LEADER>sk", "<CMD>Telescope keymaps<CR>", { desc = "[S]earch [K]eymaps" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("TelescopeLspConfig", { clear = true }),
	callback = function(event)
		local telescope = require("telescope.builtin")
		local function map(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<LEADER>cR", telescope.lsp_references, "[C]ode [R]eferences")
		map("<LEADER>cd", telescope.lsp_definitions, "[C]ode [D]efinition")
		map("<LEADER>ci", telescope.lsp_implementations, "[C]ode [I]mplementation")
		map("<LEADER>ct", telescope.lsp_type_definitions, "[C]ode [T]ype Definition")
	end,
})

-- Harpoon
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local Harpoon = require("harpoon")
Harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
})

vim.keymap.set("n", "<LEADER>m", function()
	Harpoon:list():add()
end, { desc = "[M]ark buffer" })
vim.keymap.set("n", "<LEADER>M", function()
	Harpoon.ui:toggle_quick_menu(Harpoon:list())
end, { desc = "[M]arked buffers list" })
for i = 1, 9 do
	vim.keymap.set("n", "<LEADER>" .. i, function()
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
