nnoremap = require('utils').nnoremap

vim.cmd [[autocmd BufReadPost fugitive://* set bufhidden=delete]]

nnoremap('<Leader>gac', ':Gcommit -am ""<LEFT>')
nnoremap('<Leader>gc', ':Gcommit -m ""<LEFT>')
nnoremap('<Leader>gs', ':Git<CR>')
nnoremap('<leader>gw', ':Gwrite<cr>')
nnoremap('<leader>gb', ':Git blame<cr>')

-- Resolving conflics
-- Vimcasts #33
-- also https://www.youtube.com/watch?v=PO6DxfGPQvw
nnoremap('<leader>gd', ':Gdiff<cr>')
-- " get target version: diff get target
nnoremap('<leader>dgt',  ':diffget //2 | :diffupdate<cr>')
-- " get branch version: diff get branch
nnoremap('<leader>dgb', ':diffget //3 | :diffupdate<cr>')
nnoremap('<leader>g1', ':diffget //1<CR>')
nnoremap('<leader>gj', ':diffget //3<CR>')
nnoremap('<leader>gf', ':diffget //2<CR>')
