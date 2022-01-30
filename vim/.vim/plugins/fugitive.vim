Plug 'tpope/vim-fugitive'

" vim fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gac :Gcommit -am ""<LEFT>
nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>

" Resolving conflics
" Vimcasts #33
" also https://www.youtube.com/watch?v=PO6DxfGPQvw
" nnoremap <leader>gd :Gdiff<cr>
" " get target version: diff get target
" nnoremap <leader>dgt :diffget //2 \| :diffupdate<cr>
" " get branch version: diff get branch
" nnoremap <leader>dgb :diffget //3 \| :diffupdate<cr>

noremap <leader>g1 :diffget //1<CR>
noremap <leader>gj :diffget //3<CR>
noremap <leader>gf :diffget //2<CR>
