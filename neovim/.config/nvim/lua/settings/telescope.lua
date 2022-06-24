nnoremap = require('utils').nnoremap
nnoremap('<leader>g', ':Telescope live_grep<cr>')
nnoremap('<leader>P', ':Telescope git_files find_command=rg,--ignore,--files<cr>')
nnoremap('<leader>p', ':Telescope git_files find_command=rg,--ignore,--hidden,--files<cr>')
nnoremap('<leader>b', ':Telescope buffers<cr>')
nnoremap('<leader>ht', ':Telescope help_tags<cr>')

-- require('vimp')
--
-- vimp.nnoremap('<leader>p', require('telescope.builtin').find_files)
-- vimp.nnoremap('<leader>g', require('telescope.builtin').live_grep)
-- vimp.nnoremap('<leader>b', require('telescope.builtin').buffers)
-- vimp.nnoremap('<leader>h', require('telescope.builtin').help_tags)
--
-- require('telescope').setup{
--   defaults = {
--     file_ignore_patterns = { "vendor/*", "tmp/backup/**/*", "node_modules/*" }
--   }
-- }
