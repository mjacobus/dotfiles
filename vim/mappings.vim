"===============================================================================
" Mappings
"===============================================================================

" escape alias
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>

" navigation
noremap <leader>j 10j
noremap <leader>k 10k

" buffer changing
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" find buffer file
nnoremap <leader><leader>b :b<space>

" closes buffer
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bdd :bd!<cr>
nnoremap <leader>bda :bufdo %bd!<cr>
nnoremap <leader>n :NERDTree<cr>

" search
" nnoremap * :keepjumps normal *``<cr>

" Highlight but do not jump
" http://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
nnoremap * *``

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
inoremap <C-l> <Space>=><Space>,<left>

" Ruby old style hashes to new style hashes
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

" Rails specific
" nnoremap <Leader>ac :sp app/controllers/application_controller.rb<cr>
vnoremap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
nnoremap <Leader>qq <ESC>:q<cr>

" reload buffer
nnoremap <Leader>rel :e<CR>

" Open vim rc
nnoremap <Leader>vim :vsplit ~/.vimrc<CR>
nnoremap <Leader>vima :vsplit ~/.vim/abbreviations.vim<CR>
nnoremap <Leader>vimf :vsplit ~/.vim/functions.vim<CR>
nnoremap <Leader>vimm :vsplit ~/.vim/mappings.vim<CR>
nnoremap <Leader>vimp :vsplit ~/.vim/plugins.vim<CR>

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
nnoremap <leader>et :e ~/.tmp/
nnoremap <leader>cet :e tmp/
nnoremap <leader><leader>e :!<space>

"===============================================================================
" Language specific
"===============================================================================
inoremap ć ç
inoremap Ć Ç
inoremap ,a â
inoremap ,A Â

nnoremap <leader>st <esc>:! clear && ./shell_test.sh<cr>

"===============================================================================
" PHP
"===============================================================================

autocmd FileType php nnoremap <buffer> <leader>x <esc>:! clear && time php %<cr>
autocmd FileType php nnoremap <buffer> <leader>ce <esc>:vsplit curl.sh<cr>
autocmd FileType php nnoremap <buffer> <leader>cu <esc>:! clear && ./curl.sh<cr>
autocmd FileType php nnoremap <buffer> <leader>st <esc>:! clear && ./shell_test.sh<cr>
" autocmd FileType php nnoremap <buffer> <leader>t <esc>:call PHPUnitCurrentFile()<cr>
" autocmd FileType php nnoremap <buffer> <leader>at <esc>:call PHPUnitAll()<cr>
" autocmd FileType php nnoremap <buffer> <leader>nt <esc>:call PHPUnitFocused()<cr>
" autocmd FileType php nnoremap <buffer> <leader>mt <esc>:call PHPUnitZendModule()<cr>
autocmd FileType php nnoremap <buffer> <leader>av <esc>:call PHPOpenAlternativeFile()<cr>

" php cs fixer
autocmd FileType php nnoremap <leader>cs  :call PhpFixCs('%')<cr>
autocmd FileType php nnoremap <leader>dcs :call PhpFixCs('.')<cr>
autocmd FileType php nnoremap <f4> :! ctags-php <cr>

autocmd FileType php inoremap <buffer> <C-.> .
autocmd FileType php inoremap <buffer> ... ../
autocmd FileType php inoremap <buffer> .. ->

let s:keys = [
  \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
  \ 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '_'
  \ ]
for key in s:keys
  exe 'autocmd Filetype php inoremap <buffer> .' . key . ' ->' . key
endfor

autocmd FileType php inoremap <buffer> ;; <esc>$a;

"===============================================================================
" Phython
"===============================================================================

autocmd FileType python nnoremap <buffer> <leader>x <esc>:! clear && time python %<cr>

"===============================================================================
" Ruby
"===============================================================================

autocmd FileType ruby nnoremap <buffer> <leader>x <esc>:! clear && time ruby %<cr>
autocmd FileType ruby nnoremap <buffer> <leader>cs  :call RubocopFixCs('%')<cr>
autocmd FileType ruby nnoremap <buffer> <leader>dcs :call RubocopFixCs('.')<cr>
autocmd FileType ruby nnoremap <buffer> <leader>ccs :call ReekCodeSmell('%')<cr>


"===============================================================================
" Javascript
"===============================================================================

" execute jasmine tests
" autocmd FileType javascript nnoremap <buffer> <leader>t :! clear && grunt jasmine --filter<C-R>=expand("%:t:r")<cr><cr>


autocmd FileType javascript nnoremap <buffer> <leader>x <esc>:! clear && time node %<cr>
autocmd FileType javascript nnoremap <buffer> <leader>cs :call Prettier()<cr>
autocmd FileType javascript nnoremap <buffer> <leader>cs :call Prettier()<cr>

"===============================================================================
" css
"===============================================================================
autocmd FileType css nnoremap <buffer> <leader>cs :call Prettier()<cr>
autocmd FileType sass nnoremap <buffer> <leader>cs :call Prettier()<cr>
autocmd FileType scss nnoremap <buffer> <leader>cs :call Prettier()<cr>

"===============================================================================
" C
"===============================================================================

autocmd FileType c nnoremap <buffer> <leader>x <esc>:call CompileAndRunCurrentCFile()<cr>

"===============================================================================
" BASH
"===============================================================================

autocmd FileType sh nnoremap <buffer> <leader>x <esc>:! clear && ./%<cr>
