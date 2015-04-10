" Bundle "ervandew/supertab"
Bundle "vim-scripts/ZoomWin"
Bundle "austintaylor/vim-commaobject"
Bundle "w0ng/vim-hybrid"
Bundle "jonathanfilip/vim-lucius"
Bundle "altercation/vim-colors-solarized"
  let g:solarized_termcolors=256
  " call togglebg#map("<F5>")
" TODO: consider using tristen/vim-sparkup instead of emmet
Bundle "mattn/emmet-vim"
Bundle "othree/html5.vim"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
Bundle "wikitopian/hardmode"
  " autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
  nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" Bundle "bling/vim-airline"
"   let g:airline#extensions#tabline#enabled = 1
"   " let g:airline_powerline_fonts = 1
"   let g:airline_left_sep = ''
"   let g:airline_right_sep = ''

Bundle "airblade/vim-gitgutter"
Bundle "tpope/vim-fugitive"
  autocmd BufReadPost fugitive://* set bufhidden=delete
  nnoremap <Leader>gac :Gcommit -am ""<LEFT>
  nnoremap <Leader>gc :Gcommit -m ""<LEFT>
  nnoremap <Leader>gs :Gstatus<CR>
  nnoremap <leader>gw :Gwrite<cr>
  nnoremap <leader>gb :Gblame<cr>

Bundle "rking/ag.vim"
  nnoremap g/ :Ag!<space>
  nnoremap g# :Ag! -w <C-R><C-W><space>
  nnoremap ga :AgAdd!<space>
  nnoremap gn :cnext<CR>
  nnoremap gp :cprev<CR>
  nnoremap gq :ccl<CR>
  nnoremap gl :cwindow<CR>

" snippets
Bundle "sirver/ultisnips"
Bundle "mjacobus/vim-snippets"
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"
  let g:snips_author="Marcelo Jacobus <marcelo.jacobus@gmail.com>"

Bundle "tomtom/tcomment_vim"
Bundle "Lokaltog/vim-easymotion"
" Bundle "jiangmiao/auto-pairs"
Bundle "yukunlin/auto-pairs"
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
  nnoremap <c-n> :NERDTreeToggle<CR>
  " nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

Bundle "kien/ctrlp.vim"
  " let g:ctrlp_max_height = 30
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
  " let g:ctrlp_working_path_mode = 'c'
  " set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  " set wildignore+='\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|data|tmp|log)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

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

  nnoremap a= :Tabularize /=<CR>
  vnoremap a= :Tabularize /=<CR>
  nnoremap a: :Tabularize /:\zs<CR>
  vnoremap a: :Tabularize /:\zs<CR>
  nnoremap ar :Tabularize /=><CR>
  vnoremap ar :Tabularize /=><CR>

Bundle "scrooloose/syntastic"
  let g:syntastic_enable_signs=1
  let g:syntastic_quiet_messages = {'level': 'warning'}
  let g:syntastic_php_phpcs_args="--standard=PSR2"
  " syntastic is too slow for haml and sass
  let g:syntastic_mode_map = { 'mode': 'active',
                             \ 'active_filetypes': [],
                             \ 'passive_filetypes': ['haml','scss','sass'] }
Bundle "weierophinney/argumentrewrap"

" PHP Plugins
Bundle "docteurklein/php-getter-setter.vim"
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

Bundle "joonty/vdebug"
Bundle "shawncplus/phpcomplete.vim"
Bundle 'arnaud-lb/vim-php-namespace'
  nnoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
Bundle 'stephpy/vim-php-cs-fixer'
  let g:php_cs_fixer_level = "psr2"
  let g:php_cs_fixer_fixers_list="-concat_without_spaces"
Bundle 'joonty/vim-phpqa'
  let g:phpqa_messdetector_ruleset = "~/.dotfiles/php/phpmd_ggs.xml"
  let g:phpqa_codesniffer_args = "--standard=PSR2"

" Ruby Plugins
Bundle "vim-scripts/ruby-matchit"
Bundle "mjacobus/vim-rspec-focus"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
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

Bundle "thoughtbot/vim-rspec"
  let g:rspec_command = "!rspec --drb {spec}"
  nnoremap <leader>t :call RunCurrentSpecFile()<CR>
  nnoremap <leader>n :call RunNearestSpec()<CR>
  nnoremap <C-l> :call RunLastSpec()<CR>
  nnoremap <leader>l :call RunLastSpec()<CR>
  nnoremap <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>

Bundle "shawncplus/Vim-toCterm"
  nnoremap tocterm :source ~/.vim/bundle/Vim-toCterm/tocterm.vim<CR>
