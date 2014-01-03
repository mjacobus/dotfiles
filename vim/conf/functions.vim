" ##############################################################################
" Functions
" ##############################################################################

" remove trailing white spaces before saving rb files
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
