" ##############################################################################
" Functions
" ##############################################################################

" remove trailing white spaces before saving rb files
function! TrimWhiteSpace()
 " Save cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//e

  " Restore cursor position
  call cursor(l, c)
endfunction
