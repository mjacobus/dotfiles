" this are the configs that I mean to move to init.lua
inoremap jj <ESC>:w<cr>

set undofile

set tags+=./tags.vendors
set tags+=tags-php
set tags+=tags-ruby
set tags+=tags-js
set tags+=gems.tags


set colorcolumn=80

set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set noswapfile
set splitright
set splitbelow

autocmd BufWrite * :call <sid>MkdirsIfNotExists(expand("<afile>:h"))

" TODO: find out why it wont work when the function is in this file
" create directory for the current buffer
function! <SID>MkdirsIfNotExists(directory)
  if(!isdirectory(a:directory))
    call system("mkdir -p ".shellescape(a:directory))
  endif
endfunction

" LSP stuff
set omnifunc="v:lua.vim.lsp.omnifunc"
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Avoid showing message extra message when using completion
set shortmess+=c

" gist plugin
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" use 'rking/ag.vim'
" nnoremap g# :Ag! -w <C-R><C-W><space>
nnoremap <leader>ag :Ag!<space>
vnoremap <leader>ag y:Ag! '<C-R>"'
nnoremap <leader>lag :Ag<up><cr>
nnoremap <leader>ga :AgAdd!<space>
nnoremap <leader>g# :Ag! -w <C-R><C-W><space>
nnoremap <leader>gn :cnext<CR>
nnoremap <leader>gp :cprev<CR>
nnoremap <leader>gq :ccl<CR>
nnoremap <leader>gl :cwindow<CR>

" use 'weierophinney/argumentrewrap'
nnoremap <leader>wa :call argumentrewrap#RewrapArguments()<CR>

" Plugin tpope/vim-eunuch'
nnoremap <leader>mv :Move<space>
nnoremap <leader>rn :Rename<space>
nnoremap <leader>rm :Delete<cr>

" use 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
nnoremap <c-N> :NERDTreeToggle<CR>

" use 'godlygeek/tabular'
function! CustomTabularPatterns()
  if exists('g:tabular_loaded')
    AddTabularPattern! symbols / :/l0
    AddTabularPattern! hash /^[^>]*\zs=>/
    AddTabularPattern! chunks / \S\+/l0
    AddTabularPattern! assignment / = /l0
    AddTabularPattern! comma /^[^,]*,/l1
    AddTabularPattern! colon /:\zs /l0
    AddTabularPattern! options_hashes /:\w\+ =>/
  endif
endfunction

autocmd VimEnter * call CustomTabularPatterns()

nnoremap <leader>a\| :Tabularize /\|<CR>
vnoremap <leader>a\| :Tabularize /\|<CR>
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>
nnoremap <leader>ar :Tabularize /=><CR>
vnoremap <leader>ar :Tabularize /=><CR>

" use mjacobus/vim-snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_author="Marcelo Jacobus <marcelo.jacobus@gmail.com>"


" use 'junegunn/fzf.vim'
nnoremap <c-p> :FZF<cr>
nnoremap <mleader>rm :Remove<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

"===============================================================================
" functions
"===============================================================================

" augment status line
function! ETry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction

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

" escape alias
inoremap jj <esc>:w<cr>
inoremap jJ <esc>:w<cr>
inoremap Jj <esc>:w<cr>
inoremap JJ <esc>:w<cr>
inoremap jk <esc>

" use esc jj to escape terminal mode
tnoremap <esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" This mappings embraces my muscle memory while on ergodox
nnoremap <backspace> =
vnoremap <backspace> =

" buffer changing
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" find buffer file
nnoremap <leader><leader>b :b<space>

" closes buffer
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bdd :bd!<cr>
nnoremap <leader>bda :bufdo %bd!<cr>
nnoremap <leader>n :NERDTreeToggle<cr>

" search
" nnoremap * :keepjumps normal *``<cr>

" Highlight but do not jump
" http://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
" nnoremap * *``
nnoremap * *N

" * and # search for next/previous of selected text when used in visual mode
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" * and # search for next/previous of selected text when used in visual mode
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" saves from normal mode
nnoremap <leader>s :w<cr>
nnoremap <leader>S :w<cr>

" saves and exits insert mode
inoremap ,s <ESC>:w<cr>
inoremap ,S <ESC>:w<cr>

" Select all
nnoremap <leader>a ggVG

" new tab
nnoremap <c-w>t :tabnew<cr>

" jumps to the next position after the closest closing char
inoremap ,e <Esc>/[\]})"']<cr><Esc>:nohlsearch<cr>a

" adds arrow
inoremap <C-l> <Space>=><Space>


" Rails specific
" nnoremap <Leader>ac :sp app/controllers/application_controller.rb<cr>
vnoremap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
nnoremap <Leader>qq <ESC>:q<cr>

" reload buffer
nnoremap <Leader>rel :e<CR>

" Open vim rc
nnoremap <Leader>vi :vsplit ~/.config/nvim/config.vim<CR>
nnoremap <Leader>lvi :vsplit ~/.config/nvim/init.lua<CR>

" vundle
nnoremap <Leader>bi :BundleInstall<cr>
nnoremap <Leader>bu :BundleUpdate<cr>
nnoremap <Leader>bc :BundleClean<cr>

" Fix anoying original K
nnoremap K <nop>
nnoremap U <nop>

" Find
nnoremap <leader>f <ESC>/
nnoremap <leader>* <ESC>:find<space>

" convert file to latin1 and reloads
nnoremap <leader>lat1 :write ++enc=latin1<cr>:e<cr>

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

" clear search
nnoremap <silent> <leader>F :nohlsearch<CR>

" Avoid arrow keys in command mode
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
cnoremap <C-x> <del>

" Control Ctrl and Ctrl V
vnoremap <C-c> "+y
vnoremap <leader>c "+y
nnoremap <leader>v :set paste<cr>"+p:set nopaste<cr>i

" buffer resizing mappings (shift + arrow key)
nnoremap <Up> <c-w>+
nnoremap <Down> <c-w>-
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>

" Trim all trailing whitespaces no questions asked.
nnoremap <leader>wt :call TrimWhiteSpace()<cr>

" quotes
" Single quote word
nnoremap <leader>sq ciw''<esc><left>p
" double quote word
nnoremap <leader>dq ciw""<esc><left>p

" Execute last command over a visual selection
vnoremap . :norm.<CR>

" Resolving conflics
" Vimcasts #33
nnoremap <leader>gd :Gdiff<cr>
" get target version: diff get target
nnoremap <leader>dgt :diffget //2 \| :diffupdate<cr>
" get branch version: diff get branch
nnoremap <leader>dgb :diffget //3 \| :diffupdate<cr>

" quotes
nnoremap <leader>qw ciw''<esc>P
nnoremap <leader>qw ciw""<esc>P

" sort block
nnoremap <leader>sb vip:sort<cr>
nnoremap <leader>sa vi(:sort<cr>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" offers to create/edit a tmp file
nnoremap <leader>on :e tmp/notes.txt<cr>
nnoremap <leader>et :e ~/.tmp/
nnoremap <leader>cet :e tmp/
nnoremap <leader><leader>e :!<space>

inoremap ć ç
inoremap Ć Ç
inoremap ,a â
inoremap ,A Â

nnoremap <leader>st <esc>:terminal ./shell_test<cr>
nnoremap <leader><leader>xx <esc>:! chmod +x %<cr>
nnoremap <c-l> gt
nnoremap <c-k> gt
nnoremap <c-h> gT
nnoremap <c-j> gT

"===============================================================================
" Language specific
"===============================================================================


"===============================================================================
" C
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


" nnoremap  <leader>j :buffer #<cr>:bd! term://<cr>
"
" OLD CONFIG
" source ~/.vim/functions.vim
" source ~/.vim/abbreviations.vim
" source ~/.vim/mappings.vim
"
" set path+=**
" set expandtab tabstop=2 softtabstop=2 shiftwidth=2
" set guicursor=a:blinkon0
" set hidden
" set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
" set mouse=""
" set nobackup
" set noswapfile
" set nowrap
" set number numberwidth=2
" set showmatch
" set wildignore+=*.so,*.swp,*.zip,*/build/*,*/coverage/*     " MacOSX/Linux
" set wildmode=list:longest,full
