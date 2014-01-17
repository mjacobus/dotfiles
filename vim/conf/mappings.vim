" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

let mapleader = ","         " set leader key to comma

" escape alias
inoremap jj  <esc>

" buffer changing
noremap <leader>bn :bn<cr>
noremap <leader>bp :bp<cr>

" delete all trailing whitespace in current file
noremap <leader>w :%s/\s\+$//gce \| w<cr>


" Ctrl + S saves
" remember to put the following lines into your bashrc
" stty ixany
" stty ixoff -ixon
" stty stop undef
" stty start undef
noremap <C-s> :w<cr>
" saves and exits insert mode
inoremap <C-s> <ESC>:w <cr>
" saves and continue editing
" imap <C-s> <ESC>:w<cr>a

" Select all
noremap <C-a> ggVG
inoremap <C-a> <ESC>ggVG

" Ctrl + q closes buffer
noremap <C-q> :bd<cr>
inoremap <C-q> <ESC>:bd<cr>

"Ctrl + e enters insert mode in the end of the phrase
" imap <C-e> <ESC>A
inoremap <C-e> <Esc>wa
" imap <C-e><C-e> <Esc>$a

" buffer switching
noremap <F12> :bn<cr>
inoremap <F12> :bn<cr>
noremap <C-F12> :bp<cr>
inoremap <C-F12> :bp<cr>

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
inoremap <C-F> <ESC>gg/
noremap <C-F> <ESC>gg/

" laptop
noremap <leader>lap <esc>:set mouse=<cr><esc>:colorscheme solarized<cr>

" php specific
autocmd FileType php inoremap .. ->
autocmd FileType php inoremap ;; <esc>$a;
autocmd FileType php set nofoldenable
