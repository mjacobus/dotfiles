setlocal ts=2
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

nnoremap <leader>x <esc>:terminal time node %<cr>
nnoremap <leader>cs :call javascript#LintFile()<cr>
nnoremap <leader>js :call json#LintFile()<cr>
