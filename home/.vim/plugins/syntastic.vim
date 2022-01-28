Plug 'scrooloose/syntastic'

" syntastic is too slow for haml and sass
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['haml','scss','sass'] }

let g:syntastic_php_phpcs_args='--standard=PSR2'

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
