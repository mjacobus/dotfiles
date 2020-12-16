" it looks weird on nvim
if !has('nvim')
  Plug 'Yggdroot/indentLine'
  let g:indentLine_char = '▏'
  let g:indentLine_conceallevel = 0
endif
