" ========================================================================
" Vundle config
" ========================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()

" ========================================================================
" Options
" ========================================================================
  " color railscasts256
  " color molokai256
  " color github256
  color mjdark

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

  " required for several plugins
  set nocompatible

  " enable syntax highlighting
  syntax on

  " don't wrap long lines
  set nowrap

  " show commands as we type them
  set showcmd

  " highlight matching brackets
  set showmatch

  " scroll the window when we get near the edge
  set scrolloff=4 sidescrolloff=10

  " use 2 spaces for tabs
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2
  set smarttab

  " enable line numbers, and don't make them any wider than necessary
  set number numberwidth=2

  " show the first match as search strings are typed
  " set incsearch

  " highlight the search matches
  set hlsearch

  " searching is case insensitive when all lowercase
  set ignorecase smartcase

  " assume the /g flag on substitutions to replace all matches in a line
  " set gdefault

  " set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

  " pick up external file modifications
  set autoread

  " don't abandon buffers when unloading
  set hidden

  " match indentation of previous line
  set autoindent

  " perform autoindenting based on filetype plugin
  filetype plugin indent on

  " don't blink the cursor
  set guicursor=a:blinkon0

  " show current line info (current/total)
  set ruler rulerformat=%=%l/%L

  " show status line
  set laststatus=2

  " augment status line
  function! ETry(function, ...)
    if exists('*'.a:function)
      return call(a:function, a:000)
    else
      return ''
    endif
  endfunction
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

  " When lines are cropped at the screen bottom, show as much as possible
  set display=lastline

  " flip the default split directions to sane ones
  set splitright
  set splitbelow

  " don't beep for errors
  set visualbell

  " make backspace work in insert mode
  set backspace=indent,eol,start

  " highlight trailing whitespace
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set list

  " have the mouse enabled all the time
  set mouse=a

  " use tab-complete to see a list of possiblities when entering commands
  set wildmode=list:longest,full

  " allow lots of tabs
  set tabpagemax=20

  " remember last position in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

  " Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

  " hb is handlebars
  au BufNewFile,BufRead *.hb set ai filetype=handlebars

  " hbs is handlebars
  au BufNewFile,BufRead *.hbs set ai filetype=handlebars

  " JSON is JS
  au BufNewFile,BufRead *.json set ai filetype=javascript

  " different color for each paren pairs
  let vimclojure#ParenRainbow = 1


" ========================================================================
" Plugins
" ========================================================================
Bundle "rking/ag.vim"
Bundle "tomtom/tcomment_vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "jiangmiao/auto-pairs"
Bundle "mattn/webapi-vim.git"
Bundle "mattn/gist-vim.git"
  if has("mac")
    let g:gist_clip_command = 'pbcopy'
  elseif has("unix")
    let g:gist_clip_command = 'xclip -selection clipboard'
  endif

  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1

Bundle "scrooloose/nerdtree"
    noremap <c-n> :NERDTreeToggle<CR>
    " nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

Bundle "kien/ctrlp.vim"
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Tabular
Bundle "godlygeek/tabular"
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

    nmap a= :Tabularize /=<CR>
    vnoremap a= :Tabularize /=<CR>
    nmap a: :Tabularize /:\zs<CR>
    vnoremap a: :Tabularize /:\zs<CR>
    nmap ar :Tabularize /=><CR>
    vnoremap ar :Tabularize /=><CR>

  Bundle "scrooloose/syntastic"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warning'}
    let g:syntastic_php_phpcs_args="--standard=PSR2"
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass'] }
" PHP Plugins
Bundle "shawncplus/phpcomplete.vim"
Bundle 'stephpy/vim-php-cs-fixer'
Bundle "joonty/vim-phpunitqf"
    noremap <leader>t <esc>:Test<cr>
    noremap tt <esc>:Test<cr>
    let g:phpunit_cmd = "clear && phpunit"
    let g:phpunit_args = "--configuration tests/phpunit.xml"
    map <leader>pu :let g:phpunit_args = "--configuration tests/phpunit.xml"<cr>
    map <leader>pf :let g:phpunit_args = "--configuration tests/phpunit.xml --group=focus"<cr>


" ending vundle
call vundle#end()            " required
filetype plugin indent on    " required


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
