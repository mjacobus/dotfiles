" .vimrc

source ~/.vim/conf/plugins.vim
source ~/.vim/conf/options.vim
source ~/.vim/conf/functions.vim
source ~/.vim/conf/mappings.vim
source ~/.vim/conf/appearence.vim
source ~/.vim/conf/abbreviations.vim

" ------------------------------------------------------------------------------
" Calbacks
" ------------------------------------------------------------------------------

" clear whitespaces before saving
autocmd BufWritePre     * :call TrimWhiteSpace()

" ------------------------------------------------------------------------------
" Allow overriding these settings
" ------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
