Plug 'janko-m/vim-test'

" vim test
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>at :TestSuite<CR>
nnoremap <silent> <leader>lt :TestLast<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

let g:test#javascript#jasmine#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'


" let test#ruby#spec_framework = "minitest"
let test#ruby#spec_framework = "rspec"
nnoremap <leader><leader>t :call SwitchSpecCommand()<cr>

function! SwitchSpecCommand()
  if g:test#ruby#spec_framework == "rspec"
    let g:test#ruby#minitest#file_pattern = '_\(spec\|test\)\.rb'
    let g:test#ruby#spec_framework = "minitest"
  else
    " vim test will trigger rspec
    let g:test#ruby#minitest#file_pattern = '_test\.rb'
    let g:test#ruby#spec_framework = "rspec"
  endif

  echo "using " . g:test#ruby#spec_framework . " for _spec.rb"
endfunction
