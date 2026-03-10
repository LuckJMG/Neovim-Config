-- Completion
MiniDeps.add({ source = "saghen/blink.cmp", depends = { "rafamadriz/friendly-snippets" }, checkout = "v1.9.1" })
require("blink.cmp").setup({
	appearance = { nerd_font_variant = "mono" },
	completion = {
		accept = { auto_brackets = { enabled = true } },
		documentation = {
			auto_show = false,
			auto_show_delay_ms = 500,
			window = { border = "none" },
		},
		list = { selection = { preselect = false } },
		menu = {
			draw = { treesitter = { "lsp" } },
			border = "none",
		},
	},
	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer",
		},
	},
	keymap = {
		preset = "enter",
		["<Tab>"] = { "select_next", "fallback_to_mappings" },
		["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
		["<C-n>"] = { "snippet_forward", "fallback" },
		["<C-p>"] = { "snippet_backward", "fallback" },
		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	cmdline = {
		enabled = true,
		keymap = { preset = "cmdline" },
		completion = {
			list = { selection = { preselect = false } },
			menu = {
				auto_show = function(_)
					return vim.fn.getcmdtype() == ":"
				end,
			},
			ghost_text = { enabled = true },
		},
	},
})

-- AutoTags
MiniDeps.add("windwp/nvim-ts-autotag")
require("nvim-ts-autotag").setup()

-- AutoPairs
MiniDeps.add("nvim-mini/mini.pairs")
require("mini.pairs").setup()

-- Better Text Objects
MiniDeps.add("nvim-mini/mini.ai")
require("mini.ai").setup({
	custom_textobjects = {
		-- Buffer
		B = function()
			local from = { line = 1, col = 1 }
			local to = {
				line = vim.fn.line("$"),
				col = math.max(vim.fn.getline("$"):len(), 1),
			}
			return { from = from, to = to, vis_mode = "V" }
		end,
	},
})

-- Better Comments
MiniDeps.add("nvim-mini/mini.comment")
require("mini.comment").setup()

-- Copilot
MiniDeps.add("zbirenbaum/copilot.lua")
require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = false,
		hide_during_completion = true,
		keymap = {
			accept = "<C-y>",
			next = "<C-n>",
			prev = "<C-p>",
			dismiss = "<C-e>",
		},
	},
})

vim.keymap.set("n", "<leader>a", function()
	require("copilot.suggestion").toggle_auto_trigger()
	vim.notify("Copilot Toggled")
end, { desc = "[A]I Toggle" })
