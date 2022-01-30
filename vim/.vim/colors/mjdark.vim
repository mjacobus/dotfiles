highlight clear
set background=dark
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='mjdark'


if !exists("g:kolor_bold")
  let g:kolor_bold=1
endif
if !exists("g:kolor_italic")
  let g:kolor_italic=1
endif
if !exists("g:kolor_underlined")
  let g:kolor_underlined=0
endif
if !exists("g:kolor_alternative_matchparen")
  let g:kolor_alternative_matchparen=0
endif

highlight Normal          ctermfg=251     ctermbg=235     cterm=none
highlight SpecialKey      ctermfg=111     ctermbg=none    cterm=none
highlight NonText         ctermfg=111     ctermbg=235     cterm=none
highlight Directory       ctermfg=180     ctermbg=none    cterm=none
highlight IncSearch       ctermfg=0       ctermbg=206     cterm=none
highlight LineNr          ctermfg=244     ctermbg=234     cterm=none
highlight StatusLine      ctermfg=0       ctermbg=247     cterm=none
highlight StatusLineNC    ctermfg=247     ctermbg=238     cterm=none
highlight VertSplit       ctermfg=238     ctermbg=238     cterm=none
highlight Title           ctermfg=254     ctermbg=none    cterm=none
highlight Visual          ctermfg=254     ctermbg=240     cterm=none
highlight VisualNOS       ctermfg=254     ctermbg=none    cterm=underline
highlight WildMenu        ctermfg=0       ctermbg=80      cterm=none
highlight Folded          ctermfg=103     ctermbg=234     cterm=none
highlight FoldColumn      ctermfg=103     ctermbg=234     cterm=none
highlight DiffAdd         ctermfg=none    ctermbg=23      cterm=none
highlight DiffChange      ctermfg=none    ctermbg=56      cterm=none
highlight DiffDelete      ctermfg=168     ctermbg=96      cterm=none
highlight DiffText        ctermfg=0       ctermbg=80      cterm=none
highlight SignColumn      ctermfg=244     ctermbg=235     cterm=none
highlight Conceal         ctermfg=251     ctermbg=none    cterm=none
highlight SpellBad        ctermfg=168     ctermbg=none    cterm=underline
highlight SpellCap        ctermfg=80      ctermbg=none    cterm=underline
highlight SpellRare       ctermfg=121     ctermbg=none    cterm=underline
highlight SpellLocal      ctermfg=186     ctermbg=none    cterm=underline
highlight Pmenu           ctermfg=251     ctermbg=234     cterm=none
highlight PmenuSel        ctermfg=0       ctermbg=111     cterm=none
highlight PmenuSbar       ctermfg=206     ctermbg=235     cterm=none
highlight PmenuThumb      ctermfg=235     ctermbg=206     cterm=none
highlight TabLine         ctermfg=244     ctermbg=234     cterm=none
highlight TablineSel      ctermfg=0       ctermbg=247     cterm=none
highlight TablineFill     ctermfg=244     ctermbg=234     cterm=none
highlight CursorColumn    ctermfg=none    ctermbg=236     cterm=none
highlight CursorLine      ctermfg=none    ctermbg=236     cterm=none
highlight ColorColumn     ctermfg=none    ctermbg=236     cterm=none
highlight Cursor          ctermfg=0       ctermbg=254     cterm=none
highlight Comment         ctermfg=244     ctermbg=none    cterm=none
highlight Constant        ctermfg=180     ctermbg=none    cterm=none
highlight Special         ctermfg=176     ctermbg=none    cterm=none
highlight Identifier      ctermfg=80      ctermbg=none    cterm=none
highlight PreProc         ctermfg=186     ctermbg=none    cterm=none
highlight String          ctermfg=138     ctermbg=none    cterm=none
highlight Number          ctermfg=186     ctermbg=none    cterm=none
highlight Function        ctermfg=65     ctermbg=none    cterm=none


" language specific
" hi rubyClassDeclaration   ctermfg=none   ctermbg=none     cterm=none
hi rubyClassDeclaration   ctermfg=1   ctermbg=none     cterm=none
hi rubyConstant           ctermfg=114  ctermbg=none     cterm=none
hi rubySymbol              ctermfg=4  ctermbg=none     cterm=none



if g:kolor_bold==0
  highlight ErrorMsg        ctermfg=168     ctermbg=none    cterm=none
  highlight Search          ctermfg=208     ctermbg=none    cterm=none
  highlight MoreMsg         ctermfg=121     ctermbg=none    cterm=none
  highlight ModeMsg         ctermfg=254     ctermbg=none    cterm=none
  highlight CursorLineNr    ctermfg=254     ctermbg=236     cterm=none
  highlight Question        ctermfg=80      ctermbg=none    cterm=none
  highlight WarningMsg      ctermfg=206     ctermbg=none    cterm=none
  highlight Statement       ctermfg=168     ctermbg=none    cterm=none
  highlight Type            ctermfg=141     ctermbg=none    cterm=none
  highlight Error           ctermfg=168     ctermbg=none    cterm=none
  highlight Todo            ctermfg=80      ctermbg=none    cterm=none
  highlight Keyword         ctermfg=168     ctermbg=none    cterm=none
  if g:kolor_alternative_matchparen==0
    highlight MatchParen      ctermfg=235     ctermbg=206     cterm=none
  else
    highlight MatchParen      ctermfg=235     ctermbg=247     cterm=none
  endif
else
  highlight ErrorMsg        ctermfg=168     ctermbg=none    cterm=bold
  highlight Search          ctermfg=208     ctermbg=none    cterm=bold
  highlight MoreMsg         ctermfg=121     ctermbg=none    cterm=bold
  highlight ModeMsg         ctermfg=254     ctermbg=none    cterm=bold
  highlight CursorLineNr    ctermfg=254     ctermbg=236     cterm=bold
  highlight Question        ctermfg=80      ctermbg=none    cterm=bold
  highlight WarningMsg      ctermfg=206     ctermbg=none    cterm=bold
  highlight Statement       ctermfg=168     ctermbg=none    cterm=bold
  highlight Type            ctermfg=141     ctermbg=none    cterm=bold
  highlight Error           ctermfg=168     ctermbg=none    cterm=bold
  highlight Todo            ctermfg=80      ctermbg=none    cterm=bold
  highlight Keyword         ctermfg=168     ctermbg=none    cterm=bold
  if g:kolor_alternative_matchparen==0
    highlight MatchParen      ctermfg=206     ctermbg=black     cterm=bold
  else
    highlight MatchParen      ctermfg=235     ctermbg=247     cterm=bold
  endif
endif
if g:kolor_underlined==0
  highlight Underlined      ctermfg=111     ctermbg=none    cterm=none
else
  highlight Underlined      ctermfg=111     ctermbg=none    cterm=underline
endif

