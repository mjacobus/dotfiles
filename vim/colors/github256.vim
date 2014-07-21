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
let g:colors_name="github256"

hi Normal                         ctermfg=0 ctermbg=15

" {{{ Cursor
hi Cursor                         ctermbg=239 ctermfg=15
hi CursorLine                     ctermbg=253 ctermfg=NONE cterm=NONE
hi CursorColumn                   ctermbg=7
" }}}

" {{{ Diff
hi DiffAdd                        ctermfg=233 ctermbg=194
hi DiffChange                     ctermbg=7
hi DiffText                       ctermfg=233 ctermbg=189
hi DiffDelete                     ctermfg=252 ctermbg=224
" }}}

" {{{ Folding / Line Numbering / Status Lines
hi Folded                         ctermbg=7 ctermfg=244
hi vimFold                        ctermbg=7 ctermfg=244
hi FoldColumn                     ctermbg=7 ctermfg=244

hi LineNr                         ctermfg=246 ctermbg=254
hi NonText                        ctermfg=244 ctermbg=7
hi Folded                         ctermfg=244 ctermbg=7
hi FoldeColumn                    ctermfg=244 ctermbg=7

hi VertSplit                      ctermbg=250 ctermfg=250
hi StatusLine                     ctermbg=250 ctermfg=238
hi StatusLineNC                   ctermbg=188 ctermfg=238
" }}}

" {{{ Misc
hi ModeMsg                        ctermfg=88
hi MoreMsg                        ctermfg=88

hi Title                          ctermfg=203
hi WarningMsg                     ctermfg=203
hi SpecialKey                     ctermfg=30
hi MatchParen                     ctermbg=189 ctermfg=0
hi Underlined                     ctermfg=0
hi Directory                      ctermfg=88
" }}}

" {{{ Search, Visual, etc
hi Visual                         ctermfg=15 ctermbg=61
hi VisualNOS                      ctermfg=15 ctermbg=24
hi IncSearch                      ctermbg=189 ctermfg=0
hi Search                         ctermbg=189 ctermfg=0
" }}}

" {{{ Syntax groups
hi Ignore                         ctermfg=244
hi Identifier                     ctermfg=31
hi Comment                        ctermfg=246
hi Constant                       ctermfg=18
hi String                         ctermfg=161
hi Function                       ctermfg=88
hi Statement                      ctermfg=233
hi PreProc                        ctermfg=233
hi Type                           ctermfg=60
hi Number                         ctermfg=30
hi Todo                           ctermfg=15 ctermbg=88
hi Special                        ctermfg=28
hi rubySymbol                     ctermfg=89
hi Error                          ctermbg=15 ctermfg=9
hi Todo                           ctermbg=15 ctermfg=9
hi Label                          ctermfg=0
hi StorageClass                   ctermfg=0
hi Structure                      ctermfg=0
hi TypeDef                        ctermfg=0
hi phpSpecialFunction             ctermfg=88
hi phpRegion                      ctermfg=233
hi phpClasses                     ctermfg=233
hi phpStructure                   ctermfg=232
hi Delimiter                      ctermfg=1
hi phpVarSelector                 ctermfg=31
hi phpMethodsVar                  ctermfg=31
hi phpMethods                     ctermfg=31
hi phpParent                      ctermfg=0
hi phpFunctions                   ctermfg=26
hi phpComment                     ctermfg=161
hi rubyInterpolationDelimiter     ctermfg=240
hi rubyConstant                   ctermfg=4
hi rubyClassDeclaration           ctermfg=1
hi rubyInclude                    ctermfg=31
" }}}

" {{{ Completion menus
hi WildMenu                       ctermfg=111 ctermbg=60

hi Pmenu                          ctermbg=244 ctermfg=15
hi PmenuSel                       ctermbg=189 ctermfg=0
hi PmenuSbar                      ctermbg=0   ctermfg=238
hi PmenuThumb                     ctermbg=248 ctermfg=248
" }}}


" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character       Number
hi link htmlTag         htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink        Underlined
hi link pythonFunction  Identifier
hi link Question        Type
hi link CursorIM        Cursor
hi link VisualNOS       Visual
hi link xmlTag          Identifier
hi link xmlTagName      Identifier
hi link shDeref         Identifier
hi link shVariable      Function
hi link rubySharpBang   Special
hi link perlSharpBang   Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant
" }}}

" {{{ Tabs (non-gui0
hi TabLine                        ctermfg=238 ctermbg=253
hi TabLineFill                    ctermfg=238 ctermbg=253
hi TabLineSel                     ctermfg=238
" }}}
"
" vim: sw=4 ts=4 foldmethod=marker
