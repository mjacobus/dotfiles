" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

let mapleader = ","         " set leader key to comma

" escape alias
inoremap jj  <esc>l

" buffer changing
noremap <leader>bn :bn<cr>
noremap <leader>bp :bp<cr>

" delete all trailing whitespace in current file
noremap <leader>w :%s/\s\+$//gce \| w<cr>

" Trim all trailing whitespaces no questions asked.
nnoremap <leader>tw :call TrimWhiteSpace()<cr>


" Ctrl + S saves or LEADER S saves
" remember to put the following lines into your bashrc
" stty ixany
" stty ixoff -ixon
" stty stop undef
" stty start undef
noremap <C-s> :w<cr>
noremap <leader>s :w<cr>
" saves and exits insert mode
inoremap <C-s> <ESC>:w <cr>
inoremap <leader>s <ESC>:w<cr>
" saves and continue editing
" inoremap <C-s> <ESC>:w<cr>a

" Select all
noremap <C-a> ggVG
noremap <leader>a ggVG
inoremap <C-a> <ESC>ggVG

" Ctrl + q closes buffer
noremap <C-q> :bd<cr>
inoremap <C-q> <ESC>:bd<cr>

" jumps to the next position after the closest closing char
inoremap <leader>e <Esc>/[\]})"']<cr>a

" Ruby old style hashes to new style hashes
" vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr> " die hash rockets, die!

" Rails specific
noremap <Leader>ac :sp app/controllers/application_controller.rb<cr>
vnoremap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
noremap <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
noremap <Leader>quit <ESC>:q<cr>

" semicolomn instead of colom
nnoremap ; :

" save and quit Run Ruby, for interactive editor
noremap <Leader>rr <esc>:wq<CR>

" Open vim rc
noremap <Leader>vim :edit $MYVIMRC<CR>
noremap <Leader>rel :source $MYVIMRC<CR>u

" Fix anoying original K
noremap K <nop>
noremap U <nop>
inoremap <Esc> <nop>

" Find
inoremap <C-F> <ESC>/
inoremap <leader>f <ESC>/
noremap <C-F> <ESC>/
noremap <leader>f <ESC>/

" laptop
noremap <leader>lap <esc>:set mouse=<cr><esc>:colorscheme solarized<cr>

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
nnoremap <leader>v  :set paste<cr>"+p:set nopaste<cr>i

