" augment status line
function! ETry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction

" create directory for the current buffer
function! <sid>MkdirsIfNotExists(directory)
  if(!isdirectory(a:directory))
    call system('mkdir -p '.shellescape(a:directory))
  endif
endfunction

" remove trailing white spaces before saving rb files
function! TrimWhiteSpace()
" Save cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//e

" Restore cursor position
  call cursor(l, c)
endfunction

function! PHPUnit(args)
  let cmd = "phpunit -c " . fnamemodify('tests/phpunit.xml', ':p') . " " . a:args
  execute "! clear && echo '" . cmd . "' && " . cmd
endfunction

function! PHPUnitCurrentFile()
  :call PHPUnit("%")
endfunction

function! PHPUnitAll()
  :call PHPUnit("")
endfunction

function! PHPUnitFocused()
  :call PHPUnit("--group=focus")
endfunction

function! PHPUnitZendModule()
  let module = ZendGetModuleName()
  let cmd = "phpunit -c module/" . module . "/tests/phpunit.xml"
  execute "! clear && echo '" . cmd . "' && " . cmd
endfunction

function! ZendGetModuleName()
  return split(split(expand('%'),'module/')[0], '/')[0]
endfunction
