" Vim color file
"  Maintainer: Tiza
" Last Change: 2002/08/28 Wed 00:28.
"     version: 1.3
" This color scheme uses a light background.

set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "fruit"

hi Normal       guifg=#404040 ctermfg=238 guibg=#f8f8f8

" Search
hi IncSearch    gui=UNDERLINE guifg=#404040 ctermfg=238 guibg=#40ffff
hi Search       gui=NONE guifg=#404040 ctermfg=238 guibg=#ffff60

" Messages
hi ErrorMsg     gui=NONE guifg=#ff0000 ctermfg=9 guibg=#ffe4e4
hi WarningMsg   gui=NONE guifg=#ff0000 ctermfg=9 guibg=#ffe4e4
hi ModeMsg      gui=NONE guifg=#ff4080 ctermfg=204 guibg=NONE
hi MoreMsg      gui=NONE guifg=#009070 ctermfg=29 guibg=NONE
hi Question     gui=NONE guifg=#f030d0 ctermfg=206 guibg=NONE

" Split area
hi StatusLine   gui=BOLD guifg=#f8f8f8 ctermfg=15 guibg=#404040
hi StatusLineNC gui=NONE guifg=#a4a4a4 ctermfg=248 guibg=#404040
hi VertSplit    gui=NONE guifg=#f8f8f8 ctermfg=15 guibg=#404040
hi WildMenu     gui=BOLD guifg=#f8f8f8 ctermfg=15 guibg=#ff4080

" Diff
hi DiffText     gui=NONE guifg=#e04040 ctermfg=167 guibg=#ffd8d8
hi DiffChange   gui=NONE guifg=#408040 ctermfg=65 guibg=#d0f0d0
hi DiffDelete   gui=NONE guifg=#4848ff ctermfg=12 guibg=#ffd0ff
hi DiffAdd      gui=NONE guifg=#4848ff ctermfg=12 guibg=#ffd0ff

" Cursor
hi Cursor       gui=NONE guifg=#0000ff ctermfg=21 guibg=#00e0ff
hi lCursor      gui=NONE guifg=#f8f8f8 ctermfg=15 guibg=#8000ff
hi CursorIM     gui=NONE guifg=#f8f8f8 ctermfg=15 guibg=#8000ff

" Fold
hi Folded       gui=NONE guifg=#20605c ctermfg=23 guibg=#b8e8dc
hi FoldColumn   gui=NONE guifg=#40a098 ctermfg=72 guibg=#f0f0f0

" Other
hi Directory    gui=NONE guifg=#0070b8 ctermfg=25 guibg=NONE
hi LineNr       gui=NONE guifg=#acacac ctermfg=145 guibg=NONE
hi NonText      gui=BOLD guifg=#00a0c0 ctermfg=37 guibg=#ececec
hi SpecialKey   gui=NONE guifg=#4040ff ctermfg=12 guibg=NONE
hi Title        gui=NONE guifg=#0050a0 ctermfg=25 guibg=#c0e8ff
hi Visual       gui=NONE guifg=#484848 ctermfg=238 guibg=#e0e0e0
" hi VisualNOS    gui=NONE guifg=#484848 ctermfg=238 guibg=#e0e0e0

" Syntax group
hi Comment      gui=NONE guifg=#ff4080 ctermfg=204 guibg=NONE
hi Constant     gui=NONE guifg=#8016ff ctermfg=93 guibg=NONE
hi Error        gui=BOLD guifg=#ffffff ctermfg=15 guibg=#ff4080
hi Identifier   gui=NONE guifg=#008888 ctermfg=30 guibg=NONE
hi Ignore       gui=NONE guifg=#f8f8f8 ctermfg=15 guibg=NONE
hi PreProc      gui=NONE guifg=#e06800 ctermfg=166 guibg=NONE
hi Special      gui=NONE guifg=#4a9400 ctermfg=64 guibg=NONE
hi Statement    gui=NONE guifg=#f030d0 ctermfg=206 guibg=NONE
hi Todo         gui=UNDERLINE guifg=#ff0070 ctermfg=197 guibg=#ffe0f4
hi Type         gui=NONE guifg=#0070e6 ctermfg=26 guibg=NONE
hi Underlined   gui=UNDERLINE guifg=fg guibg=NONE
