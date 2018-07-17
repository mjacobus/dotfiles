"=========================================================================
" Plugins: Vundle config
"=========================================================================
" TODO: test plugins http://web-techno.net/vim-php-ide/

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vimplugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  nnoremap <c-p> :FZF<cr>
  nnoremap <mleader>rm :Remove<cr>

Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'austintaylor/vim-commaobject'
Plug 'rstacruz/sparkup'
Plug 'othree/html5.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'wikitopian/hardmode'
Plug 'takac/vim-hardtime'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'sirver/ultisnips'
Plug 'mjacobus/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'Lokaltog/vim-easymotion'
" fixed 'jiangmiao/auto-pairs'
Plug 'yukunlin/auto-pairs'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'weierophinney/argumentrewrap'
Plug 'docteurklein/php-getter-setter.vim'
Plug 'joonty/vdebug'
Plug 'StanAngeloff/php.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'arnaud-lb/vim-php-namespace'
" This overrites nerdtree mapping
" Figure out how to fix it
" Plug 'vim-scripts/YankRing.vim'
Plug 'kana/vim-textobj-user'
" ruby
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/ruby-matchit'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'uptech/vim-open-alternate'
Plug 'noprompt/vim-yardoc'

Plug 'shawncplus/Vim-toCterm'
Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-speeddating'
Plug 'janko-m/vim-test'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'

" templates
Plug 'slim-template/vim-slim'

" Colors
" Plug 'chriskempson/base16-vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'altercation/vim-colors-solarized'
Plug 'endel/vim-github-colorscheme'
Plug 'jonathanfilip/vim-lucius'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'

" autocomplete
" http://web-techno.net/vim-php-ide/
" https://github.com/roxma/nvim-completion-manager
if has('nvim')
  Plug 'roxma/nvim-completion-manager'
  Plug 'roxma/ncm-rct-complete'
endif

Plug 'phpactor/phpactor' ,  {'do': 'composer install'}

if !has('nvim')
  " Plug 'roxma/vim-hug-neovim-rpc'
endif

" refactorings
Plug 'roxma/ncm-phpactor'
Plug 'arnaud-lb/vim-php-namespace'

" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'vim-scripts/JavaScript-Indent'

" ending vundle
call plug#end()            " required
filetype plugin indent on    " required

"===============================================================================
" Configs, mappings
"===============================================================================

" rm file
nnoremap <leader>rm :Remove<cr>

let g:hardtime_showmsg = 1


" vim-to-cterm
nnoremap tocterm :source ~/.vim/bundle/Vim-toCterm/tocterm.vim<CR>

" php use
nnoremap <Leader>u <C-O>:call PhpInsertUse()<CR>


" php-getter-setter
autocmd FileType php nnoremap <leader>pg :InsertGetterOnly<cr>
autocmd FileType php nnoremap <leader>ps :InsertSetterOnly<cr>
autocmd FileType php nnoremap <leader>pgs :InsertBothGetterSetter<cr>

let b:phpgetset_setterTemplate =
  \ "\n" .
  \ "    public function %funcname%($%varname%)\n" .
  \ "    {\n" .
  \ "        $this->%varname% = $%varname%;\n" .
  \ "    }"

let b:phpgetset_getterTemplate =
    \ "\n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"

" syntastic

" ruby
let g:syntastic_php_phpcs_args='--standard=PSR2'
" syntastic is too slow for haml and sass
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['haml','scss','sass'] }

" let g:syntastic_ruby_rubocop_exec = 'bundle exec rubocop'
" let g:syntastic_ruby_checkers = ['rubocop', 'reek', 'mri']

" debug " https://github.com/vim-syntastic/syntastic/issues/2161

" let g:syntastic_quiet_messages = {}
" let g:syntastic_php_checkers=['php', 'phpcs']
" let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
" let g:syntastic_ruby_rubocop_exec = './bin/bundle exec rubocop'
"
" if filereadable("./bin/bundle")
"   let g:syntastic_ruby_rubocop_exec = './bin/bundle exec rubocop'
" endif

" tabular
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

nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>
nnoremap <leader>ar :Tabularize /=><CR>
vnoremap <leader>ar :Tabularize /=><CR>

" Ultisnips
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_author="Marcelo Jacobus <marcelo.jacobus@gmail.com>"

" sparkup
let g:sparkupExecuteMapping = '<C-Y>,'
let g:sparkupNextMapping = '<c-y>y'

" solarized
let g:solarized_termcolors=256

" ctrl P
let g:ctrlp_max_height = 30
let g:ctrlp_show_hidden = 1
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files .']
" let g:ctrlp_working_path_mode = 'c'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
nnoremap <leader>pt :CtrlPTag<cr>

" https://github.com/JazzCore/ctrlp-cmatcher#installation
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*,*/coverage/*     " MacOSX/Linux
set wildignore+=*.so,*.swp,*.zip,*/build/*,*/coverage/*     " MacOSX/Linux

" \ 'dir':  '\v[\/]((\.(git|hg|svn))|data|tmp|log)$',
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(\.(git|hg|svn|sass-cache)|data|tmp|log|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" gist
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" public and 'open' gists
nnoremap <leader>pg :Gist -p<cr>
nnoremap <leader>og :Gist<cr>

" argumentrewrap
" does not work right after the plugin
nnoremap <leader>wa :call argumentrewrap#RewrapArguments()<CR>

" rails.vim
nnoremap <leader>av :AV<cr>
nnoremap <leader>as :AS<cr>
nnoremap <Leader>va :AV<cr>
nnoremap <Leader>sa :AS<cr>
nnoremap <Leader>vc :RVcontroller<cr>
nnoremap <Leader>sc :RScontroller<cr>
nnoremap <Leader>vu :RVunittest<CR>
nnoremap <Leader>su :RSunittest<CR>
nnoremap <Leader>vv :RVview<cr>
nnoremap <Leader>sv :RSview<cr>
nnoremap <Leader>m :Rmodel<cr>
nnoremap <Leader>sm :RSmodel<cr>
nnoremap <Leader>vm :RVmodel<cr>

" rubocop
let g:vimrubocop_keymap = 0
autocmd FileType ruby nnoremap <leader>ccs :RuboCop<cr>
autocmd FileType ruby nnoremap <leader>av :OpenAlternate<cr>

" ag.vim
nnoremap <leader>ag :Ag!<space>
vnoremap <leader>ag y:Ag! '<C-R>"'
nnoremap <leader>lag :Ag<up><cr>
" nnoremap g# :Ag! -w <C-R><C-W><space>
nnoremap <leader>ga :AgAdd!<space>
nnoremap <leader>g# :Ag! -w <C-R><C-W><space>
nnoremap <leader>gn :cnext<CR>
nnoremap <leader>gp :cprev<CR>
nnoremap <leader>gq :ccl<CR>
nnoremap <leader>gl :cwindow<CR>

" vim fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gac :Gcommit -am ""<LEFT>
nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>

" hardtime
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardTimeOn()
nnoremap <leader>h <Esc>:call HardTimeToggle()<CR>
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]

" nerdtree
nnoremap <c-n> :NERDTreeToggle<CR>


" vim test
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>at :TestSuite<CR>
nnoremap <silent> <leader>lt :TestLast<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" let test#ruby#spec_framework = "minitest"
let test#ruby#spec_framework = "rspec"
nnoremap <leader><leader>t :call SwitchSpecCommand()<cr>

let g:test#javascript#jasmine#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'


" vim-eunuch

nnoremap <leader>mv :Move<space>
nnoremap <leader>rn :Rename<space>
nnoremap <leader>rm :Remove


" majutsushi/tagbar
nnoremap <F8> :TagbarToggle<CR>


" mxw/vim-jsx
let g:jsx_ext_required = 0

" itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" 'arnaud-lb/vim-php-namespace'
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


" 'phpactor/phpactor'
autocmd FileType php setlocal omnifunc=phpactor#Complete

" Include use statement
autocmd FileType php nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
autocmd FileType php nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Goto definition of class or class member under the cursor
autocmd FileType php nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Transform the classes in the current file
autocmd FileType php nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
autocmd FileType php nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract method from selection
autocmd FileType php vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
