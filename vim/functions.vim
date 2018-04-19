" augment status line
function! ETry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction

" create directory for the current buffer
function! <SID>MkdirsIfNotExists(directory)
  if(!isdirectory(a:directory))
    call system("mkdir -p ".shellescape(a:directory))
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

  if isdirectory(parts[0] . '/tests/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  if isdirectory(parts[0] . '/test/' . test_sufixed_folder)
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

function! PHPGetAternativeFile(file)
  let currentFile = a:file

  if !empty(matchstr(currentFile, 'test\(s\)\?\/*.*Test.php$'))
    let file = PHPGetTestedFileFor(currentFile)

    if !filereadable(file)
      return
    end
  else
    let file = PHPUnitGetTestFileFor(currentFile)
  endif

  return file
endfunction

function! PHPOpenVAlternativeFile()
  let file = PHPGetAternativeFile(expand("%"))
  if !empty(file)
    execute "vsplit " . file
  endif
endfunction

function! PHPOpenAlternativeFile()
  let file = PHPGetAternativeFile(expand("%"))
  if !empty(file)
    execute "e " . file
  endif
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
  let phpunit = 'phpunit'
  let vendorPhpunit = './vendor/bin/phpunit'

  if filereadable(vendorPhpunit)
    let phpunit = vendorPhpunit
  endif

  let cmd = phpunit . " -c module/" . module . "/tests/phpunit.xml"
  execute "! clear && echo '" . cmd . "' && " . cmd
endfunction

function! VOpenTestedFile()
  let test_file = PHPGetTestedFileFor(expand("%"))
  execute "vsplit " . test_file
endfunction

function! PHPGetTestedFileFor(test_file)
  let file = a:test_file
  let file = substitute(file, "/tests/", "/src/", "gI")
  let file = substitute(file, "/test/", "/src/", "gI")
  let file = substitute(file, "Test/", "/", "gI")
  let file = substitute(file, "Test.php", ".php", "gI")
  let file = substitute(file, "tests/", "src/", "gI")
  let file = substitute(file, "test/", "src/", "gI")

  if filereadable(file)
    return file
  endif

  let file = substitute(file, "/src/", "/lib/", "gI")

  if filereadable(file)
    return file
  endif


  let file = substitute(file, "/lib/", "/library/", "gI")

  if filereadable(file)
    return file
  endif

  echo "file not found: '" . file . "'"
endfunction


function! ZendGetModuleName()
  return split(split(expand('%'),'module/')[0], '/')[0]
endfunction

function! PhpFixCs(target)
  " let cmd = '~/.dotfiles/composer/vendor/bin/./php-cs-fixer fix'
  " let options = '--level=symfony --fixers=-concat_without_spaces,-return,unused_use,align_double_arrow,phpdoc_indent,-phpdoc_short_description'
  let options = ''
  let cmd = '~/.dotfiles/composer/vendor/bin/./bro-code fix'

  if filereadable('vendor/bin/php-cs-fixer')
    let cmd = './vendor/bin/php-cs-fixer fix'
  endif

  if filereadable('vendor/bin/bro-code')
    let cmd = './vendor/bin/bro-code fix'
  endif

  let full_command = cmd . " " . a:target . " " . options
  call ClearEchoAndExecute(full_command)
endfunction

function! RubocopFixCs(target)
  let options=''
  let cmd = 'rubocop'

  if filereadable('./bin/bundle')
    let cmd = './bin/bundle exec rubocop'
  endif

  if filereadable('.rubocop.yml')
    let options = ' --config=.rubocop.yml '
  endif

  let full_command = cmd . " -a " . options . a:target
  call ClearEchoAndExecute(full_command)
endfunction

function! ReekCodeSmell(target)
  let cmd = 'reek'

  if filereadable('./bin/bundle')
    let cmd = './bin/bundle exec reek'
  endif
  let full_command = cmd . " " . a:target
  call ClearEchoAndExecute(full_command)
endfunction

function! ClearEchoAndExecute(command)
  execute "! clear && echo '" . a:command . "' && " . a:command
endfunction

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

function! CompileAndRunCurrentCFile()
  let file = expand('%')
  let binary = substitute(file, "\.c$", ".o", "")
  let command = "gcc " . file . " -o " . binary . " && ./" . binary
  call ExecuteCommand(command)
endfunction

function! ExecuteCommand(command)
  execute "! clear && echo '" . a:command . "'" . " && " . a:command
endfunction

function! SetChefTest()
  execute ":nnoremap <buffer> <leader>t :call ExecuteCommand('chef exec rspec %')<cr>"
endfunction


" test/koine/csv/mapped_columns_parser_test.rb
" lib/koine/csv/mapped_columns_parser.rb

function! RubyGetAternativeFile(file)
  let currentFile = a:file

  if !empty(matchstr(currentFile, '\(test\|spec\)\(s\)\?\/*.*_\(test\|spec\).rb$'))
    let file = RubyGetTestedFileFor(currentFile)

    if !filereadable(file)
      return
    end
  else
    let file = RubyUnitGetTestFileFor(currentFile)
  endif

  return file
endfunction

function! RubyOpenVAlternativeFile()
  let file = RubyGetAternativeFile(expand("%"))
  if !empty(file)
    execute "vsplit " . file
  endif
endfunction

function! RubyUnitGetTestFileFor(file)
  let file = fnamemodify(a:file, ':p')
  let test_file = split(file, ".rb")[0] . '_test.rb'
  let test_file = substitute(test_file, "/src/", "/tests/", "")
  let test_file = substitute(test_file, "/lib/", "/tests/", "")
  let test_file = substitute(test_file, "/library/", "/tests/", "")
  let parts = split(test_file, "/tests/")

  let after_test_folder_parts = split(parts[1], "/")

  " prefix or not to prefix test to the folder ?
  let test_sufixed_folder = after_test_folder_parts[0] . 'Test'

  if isdirectory(parts[0] . '/tests/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  if isdirectory(parts[0] . '/test/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  let parts[1] = join(after_test_folder_parts, "/")

  let test_file = join(parts, "/tests/")

  " sometimes the test folder is test instead of tests
  if !isdirectory(parts[0] . "/tests")
    let test_file = join(parts, "/test/")
  endif

  echo  test_file
  " return  test_file
endfunction

function! RubyGetTestedFileFor(test_file)
  let file = a:test_file
  let file = substitute(file, "/tests/", "/lib/", "gI")
  let file = substitute(file, "/test/", "/lib/", "gI")
  let file = substitute(file, "_spec.rb", ".rb", "gI")
  let file = substitute(file, "_test.rb", ".rb", "gI")

  if filereadable(file)
    return file
  endif

  let file = substitute(file, "/lib/", "/src/", "gI")

  if filereadable(file)
    return file
  endif

  echo "file not found: '" . file . "'"
endfunction

function! FixColors()
  highlight ColorColumn ctermbg=235
  highlight vertsplit guifg=white guibg=black ctermbg=none
  highligh MatchParen cterm=bold ctermbg=none ctermfg=green
  highligh! def link phpDocTags  phpDefine
  highligh! def link phpDocParam phpType
endfunction
