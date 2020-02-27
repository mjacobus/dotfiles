Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/ruby-matchit'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
" Plug 'uptech/vim-open-alternate'
Plug 'noprompt/vim-yardoc'


" rubocop
let g:vimrubocop_keymap = 0

autocmd FileType ruby nnoremap <leader>ccs :RuboCop<cr>
autocmd FileType ruby nnoremap <leader>av :call OpenAlternateFile()<cr>

" rails.vim
" nnoremap <leader>av :AV<cr>
nnoremap <leader>as :AS<cr>
nnoremap <Leader>va :AV<cr>
nnoremap <Leader>sa :AS<cr>
nnoremap <Leader>vc :RVcontroller<cr>
nnoremap <Leader>sc :RScontroller<cr>
nnoremap <Leader>vu :RVunittest<CR>
nnoremap <Leader>su :RSunittest<CR>
nnoremap <Leader>vv :RVview<cr>
nnoremap <Leader>sv :RSview<cr>
nnoremap <Leader>m :Rmodel<cr>
nnoremap <Leader>sm :RSmodel<cr>
nnoremap <Leader>vm :RVmodel<cr>
