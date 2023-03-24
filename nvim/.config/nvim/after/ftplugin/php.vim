setlocal ts=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal cindent
setlocal smartindent
setlocal autoindent
setlocal foldenable
setlocal foldmethod=syntax

nnoremap <buffer> <leader>x <esc>:terminal time php %<cr>
nnoremap <buffer> <leader>av <esc>:call php#PHPOpenAlternativeFile()<cr>
nnoremap <buffer> <leader>cs  :call php#LintFile('%')<cr>
nnoremap <buffer> <leader>dcs :call php#LintFile('.')<cr>
inoremap <buffer>  <C-.> .
inoremap  ... ../
inoremap  .. ->
let s:keys = [
  \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
  \ 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '_'
  \ ]
for key in s:keys
  exe 'inoremap <buffer> .' . key . ' ->' . key
endfor
inoremap ;; <esc>$a;

