"===============================================================================
" Mappings
"===============================================================================

" tags
nnoremap <f4> :! ctags <cr>

" rm file
nnoremap <leader>rm :! rm %<cr>

" escape alias
inoremap jj <esc>:w<cr>
inoremap jJ <esc>:w<cr>
inoremap Jj <esc>:w<cr>
inoremap JJ <esc>:w<cr>

" navigation
noremap <space> 10j
noremap <leader><space> 10k

" buffer changing
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" closes buffer
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bdd :bd!<cr>
nnoremap <leader>bda :bufdo %bd!<cr>
nnoremap <leader>n :NERDTree<cr>

" search
nnoremap <leader>ag :Ag! 

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
inoremap <C-l> <Space>=><Space>,<left>

" Ruby old style hashes to new style hashes
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

" Rails specific
" nnoremap <Leader>ac :sp app/controllers/application_controller.rb<cr>
vnoremap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
nnoremap <Leader>quit <ESC>:q<cr>

" save and quit Run Ruby, for interactive editor
nnoremap <Leader>rr <esc>:wq<CR>

" reload buffer
nnoremap <Leader>rel :e<CR>

" Open vim rc
nnoremap <Leader>vi :vsplit ~/.vimrc<CR>
nnoremap <Leader>va :vsplit ~/.vim/abbreviations.vim<CR>
nnoremap <Leader>vf :vsplit ~/.vim/functions.vim<CR>
nnoremap <Leader>vm :vsplit ~/.vim/mappings.vim<CR>
nnoremap <Leader>vp :vsplit ~/.vim/plugins.vim<CR>

" vundle
nnoremap <Leader>bi :BundleInstall<cr>
nnoremap <Leader>bu :BundleUpdate<cr>
nnoremap <Leader>bc :BundleClean<cr>

" Fix anoying original K
nnoremap K <nop>
nnoremap U <nop>

" Find
nnoremap <leader>f <ESC>/


" convert file to latin1 and reloads
nnoremap <leader>lat1 :write ++enc=latin1<cr>:e<cr>

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

" clear search
nnoremap <silent> ,/ :nohlsearch<CR>

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

" wrap selection inside caracter
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
vnoremap " "zdi"<C-R>z"<ESC>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" offers to create/edit a tmp file
nnoremap <leader>et :e ~/.tmp/

"===============================================================================
" Language specific
"===============================================================================

"===============================================================================
" PHP
"===============================================================================

autocmd FileType php nnoremap <buffer> <leader>x <esc>:! clear && time php %<cr>
autocmd FileType php nnoremap <buffer> <leader>ce <esc>:vsplit curl.sh<cr>
autocmd FileType php nnoremap <buffer> <leader>cu <esc>:! clear && ./curl.sh<cr>
" autocmd FileType php nnoremap <buffer> <leader>t <esc>:call PHPUnitCurrentFile()<cr>
" autocmd FileType php nnoremap <buffer> <leader>at <esc>:call PHPUnitAll()<cr>
" autocmd FileType php nnoremap <buffer> <leader>nt <esc>:call PHPUnitFocused()<cr>
" autocmd FileType php nnoremap <buffer> <leader>mt <esc>:call PHPUnitZendModule()<cr>
autocmd FileType php nnoremap <buffer> <leader>ct <esc>:call PHPUnitCreateTestFile()<cr>
autocmd FileType php nnoremap <buffer> <leader>ot <esc>:call PHPUnitCreateTestFile()<cr>
autocmd FileType php nnoremap <buffer> <leader>va <esc>:call VOpenTestedFile()<cr>

autocmd FileType php inoremap <buffer> <C-.> .
autocmd FileType php inoremap <buffer> ... ../
autocmd FileType php inoremap <buffer> .. ->
autocmd FileType php inoremap <buffer> .a ->a
autocmd FileType php inoremap <buffer> .b ->b
autocmd FileType php inoremap <buffer> .c ->c
autocmd FileType php inoremap <buffer> .d ->d
autocmd FileType php inoremap <buffer> .e ->e
autocmd FileType php inoremap <buffer> .f ->f
autocmd FileType php inoremap <buffer> .g ->g
autocmd FileType php inoremap <buffer> .h ->h
autocmd FileType php inoremap <buffer> .i ->i
autocmd FileType php inoremap <buffer> .j ->j
autocmd FileType php inoremap <buffer> .k ->k
autocmd FileType php inoremap <buffer> .l ->l
autocmd FileType php inoremap <buffer> .m ->m
autocmd FileType php inoremap <buffer> .n ->n
autocmd FileType php inoremap <buffer> .o ->o
autocmd FileType php inoremap <buffer> .p ->p
autocmd FileType php inoremap <buffer> .q ->q
autocmd FileType php inoremap <buffer> .r ->r
autocmd FileType php inoremap <buffer> .s ->s
autocmd FileType php inoremap <buffer> .t ->t
autocmd FileType php inoremap <buffer> .u ->u
autocmd FileType php inoremap <buffer> .v ->v
autocmd FileType php inoremap <buffer> .x ->x
autocmd FileType php inoremap <buffer> .v ->v
autocmd FileType php inoremap <buffer> .y ->y
autocmd FileType php inoremap <buffer> .w ->w
autocmd FileType php inoremap <buffer> ._ ->_
autocmd FileType php inoremap <buffer> ;; <esc>$a;

"===============================================================================
" Ruby
"===============================================================================

autocmd FileType ruby nnoremap <buffer> <leader>x <esc>:! clear && time ruby %<cr>
autocmd FileType ruby nnoremap <buffer> <leader><leader>ct <esc>:call SetChefTest()<cr>

"===============================================================================
" Javascript
"===============================================================================

" execute jasmine tests
" autocmd FileType javascript nnoremap <buffer> <leader>t :! clear && grunt test --filter<C-R>=expand("%:t:r")<cr><cr>

"===============================================================================
" C
"===============================================================================

autocmd FileType c nnoremap <buffer> <leader>x <esc>:call CompileAndRunCurrentCFile()<cr>

"===============================================================================
" BASH
"===============================================================================

autocmd FileType sh nnoremap <buffer> <leader>x <esc>:! clear && ./%<cr>
