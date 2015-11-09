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

Bundle "austintaylor/vim-commaobject"
Bundle "altercation/vim-colors-solarized"
Bundle "tristen/vim-sparkup"
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
Bundle "vim-scripts/ruby-matchit"
Bundle "mjacobus/vim-rspec-focus"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "mjacobus/vim-rspec"
Bundle "shawncplus/Vim-toCterm"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-vinegar"
Bundle "tpope/vim-speeddating"
" Bundle "Valloric/YouCompleteMe"
" Colors
" Bundle "chriskempson/base16-vim"
Bundle "flazz/vim-colorschemes"
Bundle "jonathanfilip/vim-lucius"
Bundle "janko-m/vim-test"

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

" vim-rspec
let g:rspec_command_rspec = "!clear && rspec --drb {spec}"
let g:rspec_command_minitest = "!clear && bundle exec rake test TEST={spec}"
let g:rspec_command = g:rspec_command_rspec
let g:rspec_file_regexp = "_\\(test\\|spec\\).rb$"
nnoremap <leader><leader>t :call SwitchSpecCommand()<cr>

autocmd FileType ruby nnoremap <buffer> <leader>t :call RunCurrentSpecFile()<cr>
" nnoremap <leader>n :call RunNearestSpec()<CR>
" nnoremap <C-l> :call RunLastSpec()<CR>
" nnoremap <leader>l :call RunLastSpec()<CR>
" nnoremap <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>

" php cs fixer
autocmd FileType php nnoremap <leader>pff  :call PhpCsFix('%')<cr>
autocmd FileType php nnoremap <leader>pfaf :call PhpCsFix('.')<cr>

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
let g:sparkupNextMapping = '<c-y>n'

" solarized
let g:solarized_termcolors=256

" ctrl P
let g:ctrlp_max_height = 30
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files .']
" let g:ctrlp_working_path_mode = 'c'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*,*/coverage/*     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|data|tmp|log)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" gits
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
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

" ag.vim
nnoremap g/ :Ag!<space>
nnoremap g# :Ag! -w <C-R><C-W><space>
nnoremap ga :AgAdd!<space>
nnoremap gn :cnext<CR>
nnoremap gp :cprev<CR>
nnoremap gq :ccl<CR>
nnoremap gl :cwindow<CR>

" fugitive
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
