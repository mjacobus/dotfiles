Plug 'rking/ag.vim'

" nnoremap g# :Ag! -w <C-R><C-W><space>
nnoremap <leader>ag :Ag!<space>
vnoremap <leader>ag y:Ag! '<C-R>"'
nnoremap <leader>lag :Ag<up><cr>
nnoremap <leader>ga :AgAdd!<space>
nnoremap <leader>g# :Ag! -w <C-R><C-W><space>
nnoremap <leader>gn :cnext<CR>
nnoremap <leader>gp :cprev<CR>
nnoremap <leader>gq :ccl<CR>
nnoremap <leader>gl :cwindow<CR>
