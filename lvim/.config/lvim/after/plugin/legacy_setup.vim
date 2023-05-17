" " use 'godlygeek/tabular'
" function! CustomTabularPatterns()
"   if exists('g:tabular_loaded')
"     AddTabularPattern! symbols / :/l0
"     AddTabularPattern! hash /^[^>]*\zs=>/
"     AddTabularPattern! chunks / \S\+/l0
"     AddTabularPattern! assignment / = /l0
"     AddTabularPattern! comma /^[^,]*,/l1
"     AddTabularPattern! colon /:\zs /l0
"     AddTabularPattern! options_hashes /:\w\+ =>/
"   endif
" endfunction
" 
" autocmd VimEnter * call CustomTabularPatterns()
" 
" nnoremap <leader>a\| :Tabularize /\|<CR>
" vnoremap <leader>a\| :Tabularize /\|<CR>
" nnoremap <leader>a= :Tabularize /=<CR>
" vnoremap <leader>a= :Tabularize /=<CR>
" nnoremap <leader>a: :Tabularize /:\zs<CR>
" vnoremap <leader>a: :Tabularize /:\zs<CR>
" nnoremap <leader>ar :Tabularize /=><CR>
" vnoremap <leader>ar :Tabularize /=><CR>

"===============================================================================
" functions
"===============================================================================

" remove trailing white spaces before saving rb files
function! TrimWhiteSpace()
" Save cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//e

" Restore cursor position
  call cursor(l, c)
endfunction

function! ClearEchoAndExecute(command)
  let cmd = "! clear && echo '" . a:command . "' && " . a:command

  if has('nvim')
    let cmd = "terminal " . a:command
  endif

  execute cmd
endfunction

function! ExecuteCommand(command)
  execute "! clear && echo '" . a:command . "'" . " && " . a:command
endfunction




"===============================================================================
" Mappings
"===============================================================================

" rm file
nnoremap <leader>rm :Delete<cr>

" Last buffer
nnoremap <leader>o <c-^>
" 
" use esc jj to escape terminal mode
tnoremap <esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" buffer changing
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" find buffer file
nnoremap <leader><leader>b :b<space>


" " search
" " nnoremap * :keepjumps normal *``<cr>
" 
" " Highlight but do not jump
" " http://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
" " nnoremap * *``
nnoremap * *N
" 
" " * and # search for next/previous of selected text when used in visual mode
" vnoremap * y/<C-R>"<CR>
" vnoremap # y?<C-R>"<CR>
" 
" vnoremap * y/<C-R>"<CR>
" vnoremap # y?<C-R>"<CR>
" 
" " * and # search for next/previous of selected text when used in visual mode
" vnoremap * y/<C-R>"<CR>
" vnoremap # y?<C-R>"<CR>
" 
" " saves from normal mode
" nnoremap <leader>s :w<cr>
" nnoremap <leader>S :w<cr>

" Select all
nnoremap <leader>a ggVG

" new tab
nnoremap <c-w>t :tabnew<cr>

" jumps to the next position after the closest closing char
inoremap ,e <Esc>/[\]})"']<cr><Esc>:nohlsearch<cr>a

" adds arrow
inoremap <C-l> <Space>=><Space>


" " Rails specific
vnoremap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
nnoremap <Leader>qq <ESC>:q<cr>

" reload buffer
nnoremap <Leader>rel :e<CR>

" " Open vim rc
" nnoremap <Leader>vi :vsplit ~/.config/nvim/config.vim<CR>
" 
" " Fix anoying original K
" nnoremap K <nop>
" nnoremap U <nop>
" 
" Find
nnoremap <leader>f <ESC>/
nnoremap <leader>* <ESC>:find<space>

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap



" " Control Ctrl and Ctrl V
" vnoremap <C-c> "+y
" vnoremap <leader>c "+y
" nnoremap <leader>v :set paste<cr>"+p:set nopaste<cr>i
" 
" buffer resizing mappings (shift + arrow key)
nnoremap <Up> <c-w>+
nnoremap <Down> <c-w>-
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>

" Trim all trailing whitespaces no questions asked.
nnoremap <leader>wt :call TrimWhiteSpace()<cr>
" 
" " quotes
" " Single quote word
" nnoremap <leader>sq ciw''<esc><left>p
" " double quote word
" nnoremap <leader>dq ciw""<esc><left>p
" 
" " Execute last command over a visual selection
" vnoremap . :norm.<CR>
" 
" " Resolving conflics
" " Vimcasts #33
" nnoremap <leader>gd :Gdiff<cr>
" " get target version: diff get target
" nnoremap <leader>dgt :diffget //2 \| :diffupdate<cr>
" " get branch version: diff get branch
" nnoremap <leader>dgb :diffget //3 \| :diffupdate<cr>
" 
" " quotes
" nnoremap <leader>qw ciw''<esc>P
" nnoremap <leader>qw ciw""<esc>P
" 
" " sort block
" nnoremap <leader>sb vip:sort<cr>
" nnoremap <leader>sa vi(:sort<cr>
" 
" " select last paste in visual mode
" nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" offers to create/edit a tmp file
nnoremap <leader>on :e tmp/notes.txt<cr>
nnoremap <leader>et :e ~/.tmp/
nnoremap <leader>cet :e tmp/
nnoremap <leader><leader>e :!<space>

nnoremap <leader>st <esc>:terminal ./shell_test<cr>
nnoremap <leader><leader>xx <esc>:! chmod +x %<cr>

"===============================================================================
" Language specific
"===============================================================================


"===============================================================================
" BASH
"===============================================================================
autocmd FileType sh nnoremap <buffer> <leader>x <esc>:terminal ./%<cr>
autocmd FileType zsh nnoremap <buffer> <leader>x <esc>:terminal ./%<cr>

"===============================================================================
" Allow overriding these settings:
"===============================================================================
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if filereadable(".project.vim")
  source .project.vim
endif

if filereadable(".project.lua")
  luafile .project.lua
endif

if filereadable(".editor/project.vim")
  source .editor/project.vim
endif

"===============================================================================
" Autocommands:
"===============================================================================
" remember last position in file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

autocmd FileType gitcommit setlocal spell spelllang=en_us,pt_br
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us,pt_br
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us,pt_br
