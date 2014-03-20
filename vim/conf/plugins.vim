" ##############################################################################
" Plugin config
" ##############################################################################

Bundle "gmarik/vundle"
Bundle "tpope/vim-bundler"
Bundle "vim-ruby/vim-ruby"
Bundle "kchmck/vim-coffee-script"
Bundle "jiangmiao/auto-pairs"
Bundle "tpope/vim-surround"
Bundle "tomtom/tcomment_vim"
Bundle "altercation/vim-colors-solarized"
Bundle "chriskempson/base16-vim"
Bundle "tsaleh/vim-matchit"
Bundle "Lokaltog/vim-easymotion"
Bundle "mattn/gist-vim"
Bundle "mattn/webapi-vim"
Bundle "vim-scripts/Align"
Bundle "rking/ag.vim"
Bundle "groenewege/vim-less"
" Bundle "shawncplus/php.vim"
Bundle "shawncplus/phpcomplete.vim"

Bundle "benmills/vimux"
Bundle "othree/html5.vim"

" snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" ------------------------------------------------------------------------------
Bundle "mattn/emmet-vim"
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" ------------------------------------------------------------------------------
Bundle "godlygeek/tabular"
nmap a= :Tabularize /=<CR>
vnoremap a= :Tabularize /=<CR>
nmap a: :Tabularize /:\zs<CR>
vnoremap a: :Tabularize /:\zs<CR>
nmap ar :Tabularize /=><CR>
vnoremap ar :Tabularize /=><CR>


" ------------------------------------------------------------------------------
Bundle "thoughtbot/vim-rspec"

" vim rspec mapping
" let g:rspec_command = "Dispatch zeus rspec {spec}"
let g:rspec_command = "!rspec --drb {spec}"
map <C-t> :call RunCurrentSpecFile()<CR>
map <leader>t :call RunCurrentSpecFile()<CR>
map <C-n> :call RunNearestSpec()<CR>
map <C-l> :call RunLastSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>

" ------------------------------------------------------------------------------
Bundle "scrooloose/nerdtree"

" let g:NERDTreeWinPos = "right"
noremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> :NERDTreeToggle<CR>


" -----------------------------------------------------------------------------
Bundle "kien/ctrlp.vim"

set wildignore+=*/tmp/*,*/coverage/*,*/netbeans/*

" ------------------------------------------------------------------------------
Bundle "bling/vim-airline"

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_powerline_fonts=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'


" ------------------------------------------------------------------------------
Bundle "mjacobus/vim-rspec-focus"

nnoremap <leader>f  :AddFocusTag<CR>          " mark as focused
nnoremap <leader>uf :RemoveAllFocusTags<CR>   " unmark all :focus tag
nnoremap <leader>p  :AddPendingTag<CR>        " mark as pending
nnoremap <leader>up :RemoveAllPendingTags<CR> " unmark all :pending tags


" ------------------------------------------------------------------------------
Bundle "tpope/vim-rails"

map <Leader>va :AV<cr>
map <Leader>sa :AS<cr>
map <Leader>vc :RVcontroller<cr>
map <Leader>sc :RScontroller<cr>
map <Leader>vu :RVunittest<CR>
map <Leader>su :RSunittest<CR>
map <Leader>vv :RVview<cr>
map <Leader>sv :RSview<cr>
map <Leader>m :Rmodel<cr>
map <Leader>sm :RSmodel<cr>
map <Leader>vm :RVmodel<cr>

" ------------------------------------------------------------------------------
Bundle "tpope/vim-fugitive"

map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>gs :Gstatus<CR>
vnoremap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>



" ------------------------------------------------------------------------------
Bundle "joonty/vim-phpunitqf"
noremap <leader><leader>t :Test<cr>

" let g:phpunit_cmd = "/usr/bin/mytest"
let g:phpunit_args = "--configuration tests/phpunit.xml"
map <leader>pu :let g:phpunit_args = "--configuration tests/phpunit.xml"<cr>
map <leader>pf :let g:phpunit_args = "--configuration tests/phpunit.xml --group=focus"<cr>

" let g:phpunit_args_append = "--repeat"
" let g:phpunit_tmpfile = "/my/new/tmp/file"


" ------------------------------------------------------------------------------
" Causing hang ups
" Bundle "joonty/vim-phpqa"
" " Clover code coverage XML file
" let g:phpqa_codecoverage_file = "coverage/coverage.xml"
" " Show markers for lines that ARE covered by tests (default = 1)
" let g:phpqa_codecoverage_showcovered = 0

" Set the codesniffer args
" let g:phpqa_codesniffer_args = "--standard=Zend"

" Don't run messdetector on save (default = 1)
" let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
" let g:phpqa_codesniffer_autorun = 0"


" ------------------------------------------------------------------------------
Bundle "majutsushi/tagbar"

noremap <leader>tb :TagbarToggle<cr>


" ------------------------------------------------------------------------------
Bundle "pgr0ss/vimux-ruby-test"

noremap <leader>rt :RunAllRubyTests<cr>

" let g:vimux_ruby_cmd_unit_test = "bundle exec ruby"
" let g:vimux_ruby_cmd_all_tests = "testdrb"
" let g:vimux_ruby_cmd_context = "FOO=bar ruby"
" let g:vimux_ruby_clear_console_on_run = 0


" ------------------------------------------------------------------------------
" Requires to be compiled with +clientserver
" Bundle 'pydave/AsyncCommand'
" Bundle 'mnick/vim-pomodoro'
"
" " Duration of a pomodoro in minutes (default: 25)
" let g:pomodoro_time_work = 25
"
" " Duration of a break in minutes (default: 5)
" let g:pomodoro_time_slack = 5
"
" " Log completed pomodoros, 0 = False, 1 = True (default: 0)
" let g:pomodoro_do_log = 1
"
" " Path to the pomodoro log file (default: /tmp/pomodoro.log)
" let g:pomodoro_log_file = "/tmp/pomodoro.log"
"
" " let g:pomodoro_notification_cmd = "mpg123 -q ~/.vim/pomodoro-notification.mp3"

" ------------------------------------------------------------------------------
Bundle "nathanaelkane/vim-indent-guides"

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2


" ------------------------------------------------------------------------------
Bundle "wikitopian/hardmode"
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>


" ------------------------------------------------------------------------------
Bundle "tpope/vim-repeat"

" ------------------------------------------------------------------------------
Bundle "tpope/vim-abolish"

" ------------------------------------------------------------------------------
Bundle "nelstrom/vim-visual-star-search"



