" Ruby old style hashes to new style hashes
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>
nnoremap <leader>x <esc>:terminal time ruby %<cr>
nnoremap <leader>cs  :call ruby#LintFile()<cr>
nnoremap <leader>dcs :call ruby#RubocopFixCs('.')<cr>
nnoremap <leader>ccs :call ruby#ReekCodeSmell('%')<cr>
nnoremap <leader>av :call ruby#OpenAlternateFile()<cr>

" Function already exists:
" https://stackoverflow.com/questions/31663750/function-already-exists-vim
