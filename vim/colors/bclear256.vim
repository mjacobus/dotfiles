" Vim colorscheme
" Name:         bclear
" Maintainer:   Ricky Cintron 'borosai' [borosai at gmail dot com]
" Last Change:  2009-08-04

hi clear
set background=light
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "bclear"

"---GUI settings
hi SpecialKey   guifg=#000000 ctermfg=0   guibg=#ffcde6
hi NonText      guifg=#969696 ctermfg=246   guibg=#f0f0f0   gui=none
hi Directory    guifg=#78681a ctermfg=94
hi ErrorMsg     guifg=#ffffff ctermfg=15   guibg=#a01010
hi IncSearch    guifg=#ffffff ctermfg=15   guibg=#ff8000   gui=none
hi Search       guifg=#000000 ctermfg=0   guibg=#ffd073
hi MoreMsg      guifg=#ffffff ctermfg=15   guibg=#3c960f   gui=none
hi ModeMsg      guifg=#323232 ctermfg=236                   gui=none
hi LineNr       guifg=#969696 ctermfg=246   guibg=#f0f0f0
hi Question     guifg=#000000 ctermfg=0   guibg=#ffde37   gui=none
hi StatusLine   guifg=#ffffff ctermfg=15   guibg=#323232   gui=none
hi StatusLineNC guifg=#f0f0f0 ctermfg=7   guibg=#646464   gui=none
hi VertSplit    guifg=#f0f0f0 ctermfg=7   guibg=#646464   gui=none
hi Title        guifg=#323232 ctermfg=236                   gui=none
hi Visual       guifg=#ffffff ctermfg=15   guibg=#1994d1
hi VisualNOS    guifg=#000000 ctermfg=0   guibg=#1994d1   gui=none
hi WarningMsg   guifg=#c8c8c8 ctermfg=251   guibg=#a01010
hi WildMenu     guifg=#ffffff ctermfg=15   guibg=#1994d1
hi Folded       guifg=#969696 ctermfg=246   guibg=#f0f0f0
hi FoldColumn   guifg=#969696 ctermfg=246   guibg=#f0f0f0
hi DiffAdd                      guibg=#deffcd ctermbg=194
hi DiffChange                   guibg=#dad7ff ctermbg=189
hi DiffDelete   guifg=#c8c8c8 ctermfg=251   guibg=#ffffff   gui=none
hi DiffText     guifg=#ffffff ctermfg=15   guibg=#767396   gui=none
hi SignColumn   guifg=#969696 ctermfg=246   guibg=#f0f0f0
hi SpellBad     guifg=#000000 ctermfg=0   guibg=#fff5c3   guisp=#f01818   gui=undercurl
hi SpellCap     guifg=#000000 ctermfg=0   guibg=#fff5c3   guisp=#14b9c8   gui=undercurl
hi SpellRare    guifg=#000000 ctermfg=0   guibg=#fff5c3   guisp=#4cbe13   gui=undercurl
hi SpellLocal   guifg=#000000 ctermfg=0   guibg=#fff5c3   guisp=#000000   gui=undercurl
hi Pmenu        guifg=#ffffff ctermfg=15   guibg=#323232
hi PmenuSel     guifg=#ffffff ctermfg=15   guibg=#1994d1
hi PmenuSbar    guifg=#323232 ctermfg=236   guibg=#323232
hi PmenuThumb   guifg=#646464 ctermfg=241   guibg=#646464   gui=none
hi TabLine      guifg=#f0f0f0 ctermfg=7   guibg=#646464   gui=none
hi TabLineSel   guifg=#ffffff ctermfg=15   guibg=#323232   gui=none
hi TabLineFill  guifg=#646464 ctermfg=241   guibg=#646464   gui=none
hi CursorColumn                 guibg=#e1f5ff ctermbg=195
hi CursorLine                   guibg=#e1f5ff ctermbg=195   gui=none
hi Cursor       guifg=#ffffff ctermfg=15   guibg=#323232
hi lCursor      guifg=#ffffff ctermfg=15   guibg=#004364
hi MatchParen   guifg=#ffffff ctermfg=15   guibg=#f00078
hi Normal       guifg=#323232 ctermfg=236   guibg=#ffffff
hi Comment      guifg=#969696 ctermfg=246
hi Constant     guifg=#1094a0 ctermfg=31
hi Special      guifg=#dc6816 ctermfg=166
hi Identifier   guifg=#3c960f ctermfg=64
hi Statement    guifg=#3b6ac8 ctermfg=62                   gui=none
hi PreProc      guifg=#294a8c ctermfg=24
hi Type         guifg=#a00050 ctermfg=125                   gui=none
hi Underlined   guifg=#323232 ctermfg=236                   gui=underline
hi Ignore       guifg=#c8c8c8 ctermfg=251
hi Error        guifg=#ffffff ctermfg=15   guibg=#c81414
hi Todo         guifg=#c81414 ctermfg=1   guibg=#ffffff

