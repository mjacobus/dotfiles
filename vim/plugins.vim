"=========================================================================
" Plugins: Vundle config
"=========================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()

" Prolematic
" " Bundle "ervandew/supertab"
" if !has('nvim')
"   " does not work very well on nvim
"   Bundle "vim-scripts/ZoomWin"
" endif
Bundle "majutsushi/tagbar"
Bundle "austintaylor/vim-commaobject"
Bundle "rstacruz/sparkup"
Bundle "othree/html5.vim"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
" Bundle "wikitopian/hardmode"
Bundle "takac/vim-hardtime"
Bundle "airblade/vim-gitgutter"
Bundle "tpope/vim-fugitive"
Bundle "rking/ag.vim"
Bundle "sirver/ultisnips"
Bundle "mjacobus/vim-snippets"
Bundle "tomtom/tcomment_vim"
Bundle "Lokaltog/vim-easymotion"
" fixed "jiangmiao/auto-pairs"
Bundle "yukunlin/auto-pairs"
Bundle "mattn/webapi-vim.git"
Bundle "mattn/gist-vim.git"
Bundle "scrooloose/nerdtree"
Bundle "kien/ctrlp.vim"
Bundle "godlygeek/tabular"
Bundle "scrooloose/syntastic"
Bundle "weierophinney/argumentrewrap"
Bundle "docteurklein/php-getter-setter.vim"
Bundle "joonty/vdebug"
Bundle "shawncplus/phpcomplete.vim"
Bundle "StanAngeloff/php.vim"
Bundle 'captbaritone/better-indent-support-for-php-with-html'
Bundle "arnaud-lb/vim-php-namespace"

" ruby
Bundle "vim-scripts/ruby-matchit"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "ngmy/vim-rubocop"

Bundle "shawncplus/Vim-toCterm"
Bundle "tpope/vim-eunuch"
" Bundle "tpope/vim-vinegar"
Bundle "tpope/vim-speeddating"
" Bundle "Valloric/YouCompleteMe"
Bundle "janko-m/vim-test"
Bundle "pangloss/vim-javascript"

" Colors
" Bundle "chriskempson/base16-vim"
" Bundle "flazz/vim-colorschemes"
" Bundle "altercation/vim-colors-solarized"
Bundle "endel/vim-github-colorscheme"
Bundle "jonathanfilip/vim-lucius"

" Bundle "othree/javascript-libraries-syntax.vim"
" Bundle "vim-scripts/JavaScript-Indent"

" ending vundle
call vundle#end()            " required
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

" tabular
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warning'}
" let g:syntastic_php_checkers=['php', 'phpcs']
" let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
let g:syntastic_php_phpcs_args='--standard=PSR2'
" syntastic is too slow for haml and sass
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['haml','scss','sass'] }

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

nnoremap a= :Tabularize /=<CR>
vnoremap a= :Tabularize /=<CR>
nnoremap a: :Tabularize /:\zs<CR>
vnoremap a: :Tabularize /:\zs<CR>
nnoremap ar :Tabularize /=><CR>
vnoremap ar :Tabularize /=><CR>

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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*,*/coverage/*     " MacOSX/Linux

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

" ag.vim
nnoremap <leader>ag :Ag!
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
