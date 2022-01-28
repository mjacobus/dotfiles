" Vim color scheme based on http://github.com/jpo/vim-railscasts-theme
"
" Name:        railscasts.vim
" Maintainer:  Ryan Bates
" License:     MIT

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "railscasts"

" Colors
" Brown        #BC9357
" Dark Blue    #6D9CBD
" Dark Green   #509E50
" Dark Orange  #CC7733
" Light Blue   #CFCFFF
" Light Green  #A5C160
" Tan          #FFC66D
" Red          #DA4938 

hi Normal     guifg=#E6E1DC ctermfg=7 guibg=#232323 ctermbg=235
hi Cursor     guibg=#FFFFFF ctermbg=15
hi CursorLine guibg=#333435 ctermbg=236 cterm=NONE
hi LineNr     guifg=#666666 ctermfg=241
hi Visual     guibg=#5A647E ctermbg=60
hi Search     guifg=NONE    guibg=#131313 ctermbg=233  gui=NONE
hi Folded     guifg=#F6F3E8 ctermfg=7 guibg=#444444 ctermbg=238  gui=NONE
hi Directory  guifg=#A5C160 ctermfg=143 gui=NONE
hi Error      guifg=#FFFFFF ctermfg=15 guibg=#990000 ctermbg=88
hi MatchParen guifg=NONE    guibg=#131313 ctermbg=233
hi Title      guifg=#E6E1DC ctermfg=7

hi Comment    guifg=#BC9357 ctermfg=137 guibg=NONE     gui=italic
hi! link Todo Comment

hi String     guifg=#A5C160 ctermfg=143
hi! link Number String
hi! link rubyStringDelimiter String

" nil, self, symbols
hi Constant guifg=#6D9CBD ctermfg=73

" def, end, include, load, require, alias, super, yield, lambda, proc
hi Define guifg=#CC7733 ctermfg=173 gui=NONE
hi! link Include Define
hi! link Keyword Define
hi! link Macro Define

" #{foo}, <%= bar %>
hi Delimiter guifg=#509E50 ctermfg=71
" hi erubyDelimiter guifg=NONE

" function name (after def)
hi Function guifg=#FFC66D ctermfg=221 gui=NONE

"@var, @@var, $var
hi Identifier guifg=#CFCFFF ctermfg=189 gui=NONE

" #if, #else, #endif

" case, begin, do, for, if, unless, while, until, else
hi Statement guifg=#CC7733 ctermfg=173 gui=NONE
hi! link PreProc Statement
hi! link PreCondit Statement

" SomeClassName
hi Type guifg=NONE gui=NONE

" has_many, respond_to, params
hi railsMethod guifg=#DA4938 ctermfg=167 gui=NONE

hi DiffAdd guifg=#E6E1DC ctermfg=7 guibg=#144212 ctermbg=235
hi DiffDelete guifg=#E6E1DC ctermfg=7 guibg=#660000 ctermbg=52

hi xmlTag guifg=#E8BF6A ctermfg=179
hi! link xmlTagName  xmlTag
hi! link xmlEndTag   xmlTag
hi! link xmlArg      xmlTag
hi! link htmlTag     xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag  xmlEndTag
hi! link htmlArg     xmlArg

" Popup Menu
" ----------
" normal item in popup
hi Pmenu guifg=#F6F3E8 ctermfg=7 guibg=#444444 ctermbg=238 gui=NONE
" selected item in popup
hi PmenuSel guifg=#000000 ctermfg=0 guibg=#A5C160 ctermbg=143 gui=NONE
" scrollbar in popup
hi PMenuSbar guibg=#5A647E ctermbg=60 gui=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb guibg=#AAAAAA ctermbg=248 gui=NONE

