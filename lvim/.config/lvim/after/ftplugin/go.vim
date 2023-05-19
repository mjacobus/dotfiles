nnoremap  <buffer> <leader>x <esc>:terminal time go run %<cr>
nnoremap  <buffer> <leader>cs <esc>:terminal time gofmt -w %<cr>

let s:keys = [
  \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
  \ 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '_'
  \ ]
for key in s:keys
  exe 'inoremap .' . key . ' .' . toupper(key)
endfor
