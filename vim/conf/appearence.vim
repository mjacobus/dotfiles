" ##############################################################################
" Appearence
" ##############################################################################

syntax enable
syntax on                         " show syntax highlighting
set t_Co=256
set cursorline
set background=dark
" colorscheme kolor
colorscheme jellybeans

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Matching open and close caracteres
highlight MatchParen ctermbg=black ctermfg=white

" ------------------------------------------------------------------------------
" Status bar
" ------------------------------------------------------------------------------

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" put useful info in status bar
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" ------------------------------------------------------------------------------
" Extra syntax highligting
" ------------------------------------------------------------------------------

" ejs files
au BufNewFile,BufRead *.ejs set filetype=js
au BufNewFile,BufRead *.ejs set filetype=html

" prawn files
au BufNewFile,BufRead *.prawn set filetype=ruby

" ------------------------------------------------------------------------------
" solarized theme config https://github.com/altercation/vim-colors-solarized
" ------------------------------------------------------------------------------

let g:solarized_termcolors=256
" let g:solarized_termtrans=1 " 1 for tranparent background
let g:solarized_visibility=1
" colorscheme solarized
" call togglebg#map("<F5>") " toggle background. Belongs to solarized schema

" ------------------------------------------------------------------------------
" molokai color scheme
" ------------------------------------------------------------------------------
let g:rehash256 = 1
