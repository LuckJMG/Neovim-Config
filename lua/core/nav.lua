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

vim.keymap.set('n', '<A-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<A-j>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<A-k>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<A-l>', function() ui.nav_file(4) end)

