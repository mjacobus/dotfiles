" Maintainer: Krzysztof Goj <Krzysztof-dot-Goj-at-gmail-dot-com>
" Last Change: 27th March 2009

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="zmrok"

" general colors
hi Normal         guifg=#F8F8F8 ctermfg=15    guibg=#141414
hi Cursor         guifg=Black      guibg=Green    gui=none
hi LineNr         guifg=#777777 ctermfg=243    guibg=Black
hi NonText 		  guifg=#808080 ctermfg=244    guibg=#202020

hi StatusLine 	guifg=#F8F8F8 ctermfg=15 guibg=#202020 gui=bold
hi StatusLineNC guifg=#777777 ctermfg=243 guibg=#202020 gui=none
hi VertSplit 	guifg=#202020 ctermfg=234 guibg=#202020 gui=none

" Vim >= 7.0 specific colors
if version >= 700
    hi CursorLine     guibg=#0d0d0d ctermbg=233
    hi CursorColumn   guibg=#0d0d0d ctermbg=233
    hi MatchParen     guifg=Black      guibg=#FFCC20 ctermbg=220 gui=bold

    hi Pmenu          guifg=#141414 ctermfg=233    guibg=#CDA869
    hi PmenuSel       guifg=#F8F8F8 ctermfg=15    guibg=#9B703F
    hi PmenuSbar                       guibg=#DAEFA3 ctermbg=193
    hi PmenuThumb     guifg=#8F9D6A ctermfg=107
endif

"Syntax hilighting

hi Comment        guifg=#888888 ctermfg=102
hi Error          guifg=red        guibg=#141414 ctermbg=233
hi Todo           guifg=red        guibg=#141414 ctermbg=233      gui=bold

hi Constant       guifg=#CF593C ctermfg=167
hi Exception      guifg=#CF593C ctermfg=167
hi Operator       guifg=#DFCC77 ctermfg=186

hi Special        guifg=orange
hi SpecialChar    guifg=orange
hi String         guifg=#D9FF77 ctermfg=192
hi Character      guifg=#FFCE43 ctermfg=221
hi Number         guifg=#FACE43 ctermfg=221

hi Statement      guifg=#A56A30 ctermfg=131    gui=bold
hi Keyword        guifg=#A56A30 ctermfg=131    gui=bold
hi Label          guifg=#A56A30 ctermfg=131    gui=bold

hi Identifier     guifg=#C7CA87 ctermfg=186     gui=none
hi Type           guifg=#C7CA87 ctermfg=186     gui=none
hi Function       guifg=#C7CA87 ctermfg=186     gui=none
hi StorageClass   guifg=#C7CA87 ctermfg=186     gui=none

hi PreProc        guifg=khaki4
