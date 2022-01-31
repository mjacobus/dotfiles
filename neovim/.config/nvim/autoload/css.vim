function! css#LintFile()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction
