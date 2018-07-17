Plug 'tpope/vim-fugitive'

" vim fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gac :Gcommit -am ""<LEFT>
nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
