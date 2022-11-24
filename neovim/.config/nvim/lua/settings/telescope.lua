nnoremap = require('utils').nnoremap
nnoremap('<leader>g', ':Telescope live_grep<cr>')
nnoremap('<leader>P', ':Telescope git_files find_command=rg,--ignore,--files<cr>')
nnoremap('<leader>b', ':Telescope buffers<cr>')
nnoremap('<leader>ht', ':Telescope help_tags<cr>')

local git_files = function()
  require('telescope.builtin').git_files({ show_untracked=true })
end

vim.keymap.set('n', '<leader>p', git_files, {})
