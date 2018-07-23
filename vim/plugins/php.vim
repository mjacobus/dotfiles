" An up-to-date Vim syntax for PHP.
Plug 'StanAngeloff/php.vim'

Plug 'captbaritone/better-indent-support-for-php-with-html'

Plug 'arnaud-lb/vim-php-namespace'
nnoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

Plug 'docteurklein/php-getter-setter.vim'

autocmd FileType php nnoremap <leader>pg :InsertGetterOnly<cr>
autocmd FileType php nnoremap <leader>ps :InsertSetterOnly<cr>
autocmd FileType php nnoremap <leader>pgs :InsertBothGetterSetter<cr>


Plug 'roxma/ncm-phpactor'
Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
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
