Plug 'itchyny/lightline.vim'

" itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }


let g:lightline.enable = {
      \ 'statusline': 1,
      \ 'tabline': 0
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? expand('%:f') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
