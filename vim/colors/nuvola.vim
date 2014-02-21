" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Dr. J. Pfefferl <johann.pfefferl@agfa.com>
" Source:	$Source: /MISC/projects/cvsroot/user/pfefferl/vim/colors/nuvola.vim,v $
" Id:	$Id: nuvola.vim,v 1.14 2003/08/11 14:03:28 pfefferl Exp $
" Last Change:	$Date: 2003/08/11 14:03:28 $

" Intro {{{1
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nuvola"

" Normal {{{1
hi Normal ctermfg=black ctermbg=NONE guifg=black guibg=#F9F5F9 ctermbg=15

" Search {{{1
hi IncSearch cterm=UNDERLINE ctermfg=Black ctermbg=brown gui=UNDERLINE guifg=Black guibg=#FFE568 ctermbg=221
hi Search term=reverse cterm=UNDERLINE ctermfg=Black ctermbg=brown gui=NONE guifg=Black guibg=#FFE568 ctermbg=221

" Messages {{{1
hi ErrorMsg gui=BOLD guifg=#EB1513 ctermfg=9 guibg=NONE
hi! link WarningMsg ErrorMsg
hi ModeMsg gui=BOLD guifg=#0070ff ctermfg=27 guibg=NONE
hi MoreMsg guibg=NONE guifg=seagreen
hi! link Question MoreMsg

" Split area {{{1
hi StatusLine term=BOLD,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=BOLD guibg=#56A0EE ctermbg=75 guifg=white
hi StatusLineNC gui=NONE guibg=#56A0EE ctermbg=75 guifg=#E9E9F4 ctermfg=7
hi! link VertSplit StatusLineNC
hi WildMenu gui=UNDERLINE guifg=#56A0EE ctermfg=75 guibg=#E9E9F4 ctermbg=7

" Diff {{{1
hi DiffText   gui=NONE guifg=#f83010 ctermfg=202 guibg=#ffeae0 ctermbg=224
hi DiffChange gui=NONE guifg=#006800 ctermfg=22 guibg=#d0ffd0 ctermbg=194
hi DiffDelete gui=NONE guifg=#2020ff ctermfg=21 guibg=#c8f2ea ctermbg=194
hi! link DiffAdd DiffDelete

" Cursor {{{1
hi Cursor       gui=none guifg=black guibg=orange
"hi lCursor      gui=NONE guifg=#f8f8f8 ctermfg=15 guibg=#8000ff ctermbg=93
hi CursorIM     gui=NONE guifg=#f8f8f8 ctermfg=15 guibg=#8000ff ctermbg=93
hi CursorLine cterm=NONE ctermbg=253


" Fold {{{1
hi Folded gui=NONE guibg=#B5EEB5 ctermbg=157 guifg=black
"hi FoldColumn gui=NONE guibg=#9FD29F ctermbg=151 guifg=black
hi! link FoldColumn Folded

" Other {{{1
hi Directory    gui=NONE guifg=#0000ff ctermfg=21 guibg=NONE
hi LineNr       gui=NONE guifg=#8080a0 ctermfg=103 guibg=NONE
hi NonText      gui=BOLD guifg=#4000ff ctermfg=57 guibg=#EFEFF7 ctermbg=7
"hi SpecialKey   gui=NONE guifg=#A35B00 ctermfg=130 guibg=NONE
hi Title        gui=BOLD guifg=#1014AD ctermfg=19 guibg=NONE
hi Visual term=reverse ctermfg=yellow ctermbg=black gui=NONE guifg=Black guibg=#BDDFFF ctermbg=153
hi VisualNOS term=reverse ctermfg=yellow ctermbg=black gui=UNDERLINE guifg=Black guibg=#BDDFFF ctermbg=153

" Syntax group {{{1
hi Comment term=BOLD ctermfg=darkgray guifg=#3F6B5B ctermfg=240
hi Constant term=UNDERLINE ctermfg=red guifg=#B91F49 ctermfg=125
hi Error term=REVERSE ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Identifier term=UNDERLINE ctermfg=Blue guifg=Blue
hi Number   term=UNDERLINE ctermfg=red gui=NONE guifg=#00C226 ctermfg=2
hi PreProc term=UNDERLINE ctermfg=darkblue guifg=#1071CE ctermfg=26
hi Special term=BOLD ctermfg=darkmagenta guifg=red2
hi Statement term=BOLD ctermfg=DarkRed gui=NONE guifg=#F06F00 ctermfg=202
hi Tag term=BOLD ctermfg=DarkGreen guifg=DarkGreen
hi Todo term=STANDOUT ctermbg=Yellow ctermfg=blue guifg=Blue guibg=Yellow
hi Type term=UNDERLINE ctermfg=Blue gui=NONE guifg=Blue
hi! link String	Constant
hi! link Character	Constant
hi! link Boolean	Constant
hi! link Float		Number
hi! link Function	Identifier
hi! link Conditional	Statement
hi! link Repeat	Statement
hi! link Label		Statemengreen
hi! link Operator	Statement
hi! link Keyword	Statement
hi! link Exception	Statement
hi! link Include	PreProc
hi! link Define	PreProc
hi! link Macro		PreProc
hi! link PreCondit	PreProc
hi! link StorageClass	Type
hi! link Structure	Type
hi! link Typedef	Type
hi! link SpecialChar	Special
hi! link Delimiter	Special
hi! link SpecialComment Special
hi! link Debug		Special

" HTML {{{1
hi htmlLink                 gui=UNDERLINE guifg=#0000ff ctermfg=21 guibg=NONE
hi htmlBold                 gui=BOLD
hi htmlBoldItalic           gui=BOLD,ITALIC
hi htmlBoldUnderline        gui=BOLD,UNDERLINE
hi htmlBoldUnderlineItalic  gui=BOLD,UNDERLINE,ITALIC
hi htmlItalic               gui=ITALIC
hi htmlUnderline            gui=UNDERLINE
hi htmlUnderlineItalic      gui=UNDERLINE,ITALIC

" vim600:foldmethod=marker
