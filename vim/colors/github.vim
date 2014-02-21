" Vim color file
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

hi clear

set background=light
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="github"

hi Normal       guifg=#000000 ctermfg=0 guibg=#F8F8FF ctermbg=15

" {{{ Cursor
hi Cursor		guibg=#444454 ctermbg=239 guifg=#F8F8FF ctermfg=15
hi CursorLine	guibg=#D8D8DD ctermbg=253
hi CursorColumn	guibg=#E8E8EE ctermbg=7
" }}}

" {{{ Diff
hi DiffAdd         guifg=#003300 ctermfg=233 guibg=#DDFFDD ctermbg=194 gui=none
hi DiffChange                    guibg=#ececec ctermbg=7 gui=none
hi DiffText        guifg=#000033 ctermfg=233 guibg=#DDDDFF ctermbg=189 gui=none
hi DiffDelete      guifg=#DDCCCC ctermfg=252 guibg=#FFDDDD ctermbg=224 gui=none
" }}}

" {{{ Folding / Line Numbering / Status Lines
hi Folded		guibg=#ECECEC ctermbg=7 guifg=#808080 ctermfg=244 gui=bold
hi vimFold		guibg=#ECECEC ctermbg=7 guifg=#808080 ctermfg=244 gui=bold
hi FoldColumn	guibg=#ECECEC ctermbg=7 guifg=#808080 ctermfg=244 gui=bold

hi LineNr		guifg=#959595 ctermfg=246 guibg=#ECECEC ctermbg=7 gui=bold
hi NonText		guifg=#808080 ctermfg=244 guibg=#ECECEC ctermbg=7
hi Folded		guifg=#808080 ctermfg=244 guibg=#ECECEC ctermbg=7 gui=bold
hi FoldeColumn  guifg=#808080 ctermfg=244 guibg=#ECECEC ctermbg=7 gui=bold

hi VertSplit	guibg=#bbbbbb ctermbg=250 guifg=#bbbbbb ctermfg=250 gui=none
hi StatusLine   guibg=#bbbbbb ctermbg=250 guifg=#404040 ctermfg=238 gui=bold
hi StatusLineNC guibg=#d4d4d4 ctermbg=188 guifg=#404040 ctermfg=238 gui=italic
" }}}

" {{{ Misc
hi ModeMsg		guifg=#990000 ctermfg=88
hi MoreMsg		guifg=#990000 ctermfg=88

hi Title		guifg=#ef5939 ctermfg=203
hi WarningMsg	guifg=#ef5939 ctermfg=203
hi SpecialKey   guifg=#177F80 ctermfg=30 gui=italic

hi MatchParen	guibg=#cdcdfd ctermbg=189 guifg=#000000 ctermfg=0
hi Underlined	guifg=#000000 ctermfg=0 gui=underline
hi Directory	guifg=#990000 ctermfg=88
" }}}

" {{{ Search, Visual, etc
hi Visual		guifg=#FFFFFF ctermfg=15 guibg=#3465a4 ctermbg=61 gui=none
hi VisualNOS    guifg=#FFFFFF ctermfg=15 guibg=#204a87 ctermbg=24 gui=none
hi IncSearch	guibg=#cdcdfd ctermbg=189 guifg=#000000 ctermfg=0 gui=italic
hi Search		guibg=#cdcdfd ctermbg=189 guifg=#000000 ctermfg=0 gui=italic
" }}}

" {{{ Syntax groups
hi Ignore		guifg=#808080 ctermfg=244
hi Identifier	guifg=#0086B3 ctermfg=31
hi PreProc		guifg=#A0A0A0 ctermfg=247 gui=bold
hi Comment		guifg=#999988 ctermfg=246
hi Constant		guifg=#177F80 ctermfg=30 gui=none
hi String		guifg=#D81745 ctermfg=161
hi Function		guifg=#990000 ctermfg=88 gui=bold
hi Statement	guifg=#000000 ctermfg=0 gui=bold
hi Type			guifg=#445588 ctermfg=60 gui=bold
hi Number		guifg=#1C9898 ctermfg=30
hi Todo			guifg=#FFFFFF ctermfg=15 guibg=#990000 ctermbg=88 gui=bold
hi Special		guifg=#159828 ctermfg=28 gui=bold
hi rubySymbol   guifg=#960B73 ctermfg=89
hi Error        guibg=#f8f8ff ctermbg=15 guifg=#ff1100 ctermfg=9 gui=undercurl
hi Todo         guibg=#f8f8ff ctermbg=15 guifg=#ff1100 ctermfg=9 gui=underline
hi Label        guifg=#000000 ctermfg=0 gui=bold
hi StorageClass guifg=#000000 ctermfg=0 gui=bold
hi Structure    guifg=#000000 ctermfg=0 gui=bold
hi TypeDef      guifg=#000000 ctermfg=0 gui=bold
" }}}

" {{{ Completion menus
hi WildMenu     guifg=#7fbdff ctermfg=111 guibg=#425c78 ctermbg=60 gui=none

hi Pmenu        guibg=#808080 ctermbg=244 guifg=#ffffff ctermfg=15 gui=bold
hi PmenuSel     guibg=#cdcdfd ctermbg=189 guifg=#000000 ctermfg=0 gui=italic
hi PmenuSbar    guibg=#000000 ctermbg=0 guifg=#444444 ctermfg=238
hi PmenuThumb   guibg=#aaaaaa ctermbg=248 guifg=#aaaaaa ctermfg=248
" }}}

" {{{ Spelling
hi spellBad     guisp=#fcaf3e
hi spellCap     guisp=#73d216
hi spellRare    guisp=#fcaf3e
hi spellLocal   guisp=#729fcf
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character		Number
hi link htmlTag			htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant
" }}}

" {{{ Tabs (non-gui0
hi TabLine		guifg=#404040 ctermfg=238 guibg=#dddddd ctermbg=253 gui=none
hi TabLineFill	guifg=#404040 ctermfg=238 guibg=#dddddd ctermbg=253 gui=none
hi TabLineSel	guifg=#404040 ctermfg=238 gui=bold
" }}}
"
" vim: sw=4 ts=4 foldmethod=marker
