" gc go gC gO
set filetype=json
set foldmethod=syntax
set foldlevel=99

function! LintJson()
  call ClearEchoAndExecute('prettify_json %')
endfunction

nnoremap <buffer> <leader>cs :call LintJson()<cr>
