" Ruby old style hashes to new style hashes
vnoremap <buffer> <leader>h :s/:\(\w*\) *=>/\1:/g<cr>
nnoremap <buffer> <leader>x <esc>:terminal time ruby %<cr>
nnoremap <buffer> <leader>cs  :call ruby#LintFile()<cr>
nnoremap <buffer> <leader>dcs :call ruby#RubocopFixCs('.')<cr>
nnoremap <buffer> <leader>ccs :call ruby#ReekCodeSmell('%')<cr>
nnoremap <buffer> <leader>av :call ruby#OpenAlternateFile()<cr>

" Function already exists:
" https://stackoverflow.com/questions/31663750/function-already-exists-vim
