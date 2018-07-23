" there is no currently ctrl p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(\.(git|hg|svn|sass-cache)|data|tmp|log|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ctrl P
let g:ctrlp_max_height = 30
let g:ctrlp_show_hidden = 1
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files .']
" let g:ctrlp_working_path_mode = 'c'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
nnoremap <leader>pt :CtrlPTag<cr>

" https://github.com/JazzCore/ctrlp-cmatcher#installation
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
