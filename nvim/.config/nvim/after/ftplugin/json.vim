" gc go gC gO
setlocal filetype=json
setlocal foldmethod=syntax
setlocal foldlevel=99

function! LintJson()
  call ClearEchoAndExecute('prettify_json %')
endfunction

nnoremap <buffer> <leader>cs :call LintJson()<cr>
