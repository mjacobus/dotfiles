" gc go gC gO
set filetype=json
set foldmethod=syntax
set foldlevel=99

nnoremap <leader>cs :call LintJson()<cr>

function! LintJson()
  call ClearEchoAndExecute('prettify_json %')
endfunction
