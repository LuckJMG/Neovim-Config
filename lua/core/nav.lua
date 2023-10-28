-- tmux integration
vim.cmd [[ noremap <silent> {ctrl-l} :<C-U>TmuxNavigateRight<cr> ]]

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

-- Harpoon
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>m', mark.add_file)
vim.keymap.set('n', '<leader>pm', ui.toggle_quick_menu)
vim.keymap.set('n', '<A-n>', function() ui.nav_next() end)
vim.keymap.set('n', '<A-p>', function() ui.nav_prev() end)

-- Undo
vim.opt.undofile = true

