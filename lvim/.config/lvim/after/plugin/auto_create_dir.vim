autocmd BufWrite * :call <sid>MkdirsIfNotExists(expand("<afile>:h"))
" TODO: find out why it wont work when the function is in this file
" create directory for the current buffer
function! <SID>MkdirsIfNotExists(directory)
  if(!isdirectory(a:directory))
    call system("mkdir -p ".shellescape(a:directory))
  endif
endfunction
