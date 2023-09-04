require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

vim.cmd[[highlight IndentBlanklineChar guifg=#44475A gui=nocombine]]
vim.cmd[[highlight IndentBlanklineContextChar guifg=#6272A4 gui=nocombine]]
