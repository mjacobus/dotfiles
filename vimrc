" ========================================================================
" Vundle config
" ========================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()


" ========================================================================
" Plugins
" ========================================================================
Bundle "scrooloose/nerdtree"
	noremap <c-n> :NERDTreeToggle<CR>
	nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

Bundle "kien/ctrlp.vim"
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

Bundle "tomtom/tcomment_vim"

call vundle#end()            " required
filetype plugin indent on    " required

" ========================================================================
" Options
" ========================================================================
" color railscasts256
" color molokai256
" color github256
" color mjdark

let mapleader = ","
set pastetoggle=<F3>
set clipboard=unnamedplus   " use the system clipboard
set backspace=2             " make backspace work like most other apps
set nobackup                " no backup. Too 70's
set noswapfile              " no backup. Too 70's
set cursorline
" set relativenumber
set colorcolumn=80
set mouse=""                " disable mouse

" undo per file
set undodir=~/.vim/undodir
set undofile
if filewritable(&undodir) == 0
  call mkdir(&undodir, "p")
endif

" ========================================================================
" Mappings
" ========================================================================

" escape alias
inoremap jj <esc>l

" buffer changing
noremap <leader>bn :bn<cr>
noremap <leader>bp :bp<cr>

" saves from normal mode
noremap <leader>s <esc>:w<cr>
noremap <leader>S <esc>:w<cr>

" saves and exits insert mode
inoremap <leader>s <ESC>:w<cr>
inoremap <leader>S <ESC>:w<cr>

" Select all
noremap <C-a> ggVG
noremap <leader>a ggVG
inoremap <C-a> <ESC>ggVG

" Ctrl + q closes buffer
noremap <leader>,bd :bd<cr>
noremap <leader>,q :bd<cr>
noremap <leader>,qq :bd!<cr>
inoremap <leader>,q <ESC> :bd<cr>
inoremap <leader>,qq <ESC> :bd!<cr>

" jumps to the next position after the closest closing char
inoremap <leader>e <Esc>/[\]})"']<cr><Esc>:nohlsearch<cr>a
nnoremap <leader>e <Esc>/[\]})"']<cr><Esc>:nohlsearch<cr>a

" Ruby old style hashes to new style hashes
" vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr> " die hash rockets, die!

" Rails specific
noremap <Leader>ac :sp app/controllers/application_controller.rb<cr>
vnoremap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
noremap <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
noremap <Leader>quit <ESC>:q<cr>


" save and quit Run Ruby, for interactive editor
noremap <Leader>rr <esc>:wq<CR>

" Open vim rc
noremap <Leader>vim :edit $MYVIMRC<CR>
noremap <Leader>rel :source $MYVIMRC<CR>

" Fix anoying original K
noremap K <nop>
noremap U <nop>
inoremap <Esc> <nop>

" Find
inoremap <leader>f <ESC>/
noremap <leader>f <ESC>/

" php specific
autocmd FileType php inoremap ... ../
autocmd FileType php inoremap .. ->
autocmd FileType php inoremap ;; <esc>$a;
autocmd FileType php set nofoldenable

" convert file to latin1
nnoremap <leader>lat1 :write ++enc=latin1<cr>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" clear search
nmap <silent> ,/ :nohlsearch<CR>

" Avoid arrow keys in command mode
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
cnoremap <C-x> <del>

" Control Ctrl and Ctrl V
vnoremap <C-c> "+y
vnoremap <leader>c "+y
inoremap <C-v> <esc>:set paste<cr>"+p:set nopaste<cr>i
nnoremap <leader>v :set paste<cr>"+p:set nopaste<cr>i

" buffer resizing mappings (shift + arrow key)
nnoremap <Up> <c-w>+
nnoremap <Down> <c-w>-
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>


" Trim all trailing whitespaces no questions asked.
nnoremap <leader>tw :call TrimWhiteSpace()<cr>

" Tab management
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprev<cr>

" ========================================================================
" Functions
" ========================================================================

" remove trailing white spaces before saving rb files
function! TrimWhiteSpace()
" Save cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//e

" Restore cursor position
  call cursor(l, c)
endfunction
