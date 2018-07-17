Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" gist
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" public and 'open' gists
nnoremap <leader>cpg :Gist -p<cr>
nnoremap <leader>cog :Gist<cr>
