call plug#begin('~/.vimplugged')

" common files for vim and neovim
for f in split(glob('~/.vim/plugins/*.vim'), '\n')
  exe 'source' f
endfor


" Specific files for nvim or vim 
if has('nvim')
  for f in split(glob('~/.vim/plugins/nvim/*.vim'), '\n')
    exe 'source' f
  endfor
else
  for f in split(glob('~/.vim/plugins/vim/*.vim'), '\n')
    exe 'source' f
  endfor
endif

call plug#end()
