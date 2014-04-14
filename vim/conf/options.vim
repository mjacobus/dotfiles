" ##############################################################################
" General options
" ##############################################################################

" sintax highlighting
filetype plugin indent on
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set incsearch                     " for highlighting search
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=a                       " enable mouse support
set mouse-=a                      " disable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamedplus         " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set nowrap                        " no wrap
set number                        " line numbers
set pastetoggle=<F3>              " for toggling tabulation on text pasting
set backspace=2                   " make backspace work like most other apps"
set nobackup                      " no backup. Too 70's
set noswapfile                    " no backup. Too 70's

" undo per file
set undodir=~/.vim/undodir
set undofile
if filewritable(&undodir) == 0
  call mkdir(&undodir, "p")
endif

set showcmd

" for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72
