vim.keymap.set('n', '<leader>ag', ':Ag!<space>')
vim.keymap.set('n', '<leader>ahg', ':Ag! --hidden<space>')
vim.keymap.set('n', '<leader>ayg', 'y:Ag! \'<C-R>"\'')
vim.keymap.set('n', '<leader>ga', ':AgAdd!<space>')
vim.keymap.set('n', '<leader>g#', ':Ag! -w <C-R><C-W><space>')
vim.keymap.set('n', '<leader>gn', ':cnext<CR>')
-- vim.keymap.set('n', '<leader>gp', ':cprev<CR>') -- conflict
vim.keymap.set('n', '<leader>gq', ':ccl<CR>')
-- vim.keymap.set('n', '<leader>gl', ':cwindow<CR>') -- conflict
