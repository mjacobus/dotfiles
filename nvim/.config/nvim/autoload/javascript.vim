function javascript#LintFile()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction
