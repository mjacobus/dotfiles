" augment status line
function! ETry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction

" create directory for the current buffer
" function! MkdirsIfNotExists(directory)
"   if(!isdirectory(a:directory))
"     call system('mkdir -p '.shellescape(a:directory))
"   endif
" endfunction

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
  let expected_config_file = fnamemodify('tests/phpunit.xml', ':p')
  let config_param = ''

  if filereadable(expected_config_file)
    let config_param = ' -c ' . expected_config_file
  endif

  let cmd = "phpunit " . config_param . " " . a:args
  execute "! clear && echo '" . cmd . "' && " . cmd
endfunction

function! PHPUnitCurrentFile()
  " if file is test run file
  " else run test file
  let file = expand('%')
  let parts = split(file, 'Test')

  if len(parts) > 1
    :call PHPUnit("%")
  else
    :call PHPUnit(PHPUnitGetTestFileFor(file))
  endif
endfunction

function! PHPUnitGetTestFileFor(file)
  let file = fnamemodify(a:file, ':p')
  let test_file = split(file, ".php")[0] . 'Test.php'
  let test_file = substitute(test_file, "/src/", "/tests/", "")
  let test_file = substitute(test_file, "/lib/", "/tests/", "")
  let test_file = substitute(test_file, "/library/", "/tests/", "")
  let parts = split(test_file, "/tests/")

  let after_test_folder_parts = split(parts[1], "/")

  " prefix or not to prefix test to the folder ?
  let test_sufixed_folder = after_test_folder_parts[0] . 'Test'
  if isdirectory(parts[0] . "/tests")
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  let parts[1] = join(after_test_folder_parts, "/")

  let test_file = join(parts, "/tests/")

  " sometimes the test folder is test instead of tests
  if !isdirectory(parts[0] . "/tests")
    let test_file = join(parts, "/test/")
  endif

  return  test_file
endfunction

function! PHPUnitCreateTestFile()
  let test_file = PHPUnitGetTestFileFor(expand("%"))
  execute "vsplit " . test_file
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

function! PhpCsFix(target)
  let cmd = 'php-cs-fixer fix'
  let options = '--level=symfony --fixers=-concat_without_spaces,-return,unused_use,align_double_arrow,phpdoc_indent,-phpdoc_short_description'
  let full_command = cmd . " " . a:target . " " . options
  call ClearEchoAndExecute(full_command)
endfunction

function! ClearEchoAndExecute(command)
  execute "! clear && echo '" . a:command . "' && " . a:command
endfunction
