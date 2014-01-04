" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

let mapleader = ","         " set leader key to comma

" delete all trailing whitespace in current file
map <leader>w :%s/\s\+$//gce \| w<cr>


" Ctrl + S saves
" remember to put the following lines into your bashrc
" stty ixany
" stty ixoff -ixon
" stty stop undef
" stty start undef
map <C-s> :w<cr>
" saves and exits insert mode
imap <C-s> <ESC>:w <cr>
" saves and continue editing
" imap <C-s> <ESC>:w<cr>a

" Select all
map <C-a> ggVG
imap <C-a> <ESC>ggVG

" Ctrl + q closes buffer
map <C-q> :bd<cr>
imap <C-q> <ESC>:bd<cr>

"Ctrl + e enters insert mode in the end of the phrase
" imap <C-e> <ESC>A
imap <C-e> <Esc>wa

" buffer switching
map <F12> :bn<cr>
imap <F12> :bn<cr>
map <C-F12> :bp<cr>
imap <C-F12> :bp<cr>

" Ruby old style hashes to new style hashes
" vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr> " die hash rockets, die!

" Rails specific
map <Leader>ac :sp app/controllers/application_controller.rb<cr>
vmap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
map <Leader>quit <ESC>:q<cr>

" semicolomn instead of colom
nnoremap ; :

" save and quit Run Ruby, for interactive editor
map <Leader>rr <esc>:wq<CR>

" Open vim rc
map <Leader>vim :edit $MYVIMRC<CR>
map <Leader>reload :source $MYVIMRC<CR>u

" Fix anoying original K
map K :echo "K remapped"
unmap K

" Find
imap <C-F> <ESC>gg/
map <C-F> <ESC>gg/

" laptop
map <leader>lap <esc>:set mouse=<cr><esc>:colorscheme solarized<cr>

" php specific
autocmd FileType php inoremap .. ->
