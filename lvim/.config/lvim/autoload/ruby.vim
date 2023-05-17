function ruby#OpenAlternateFile()
  " Need to update dotfiled
  let file = system('dotfiled ' . expand('%'))
  " let file = system('alternative_file ' . expand('%'))
  if !empty(file)
    execute "e " . file
  endif
endfunction

function ruby#LintFile()
  call ruby#RubocopFixCs('%')
endfunction

" # not sure if it works
function! ruby#RubocopFixCs(target)
  let options=''
  let cmd = 'bundle exec rubocop'

  if filereadable('./bin/bundle')
    let cmd = './bin/bundle exec rubocop'
  endif

  if filereadable('.rubocop.yml')
    let options = ' --config=.rubocop.yml '
  endif

  let full_command = cmd . " -A " . options . a:target
  call ClearEchoAndExecute(full_command)
endfunction

function! ruby#ReekCodeSmell(target)
  let cmd = 'bundle exec reek'

  if filereadable('./bin/bundle')
    let cmd = './bin/bundle exec reek'
  endif
  let full_command = cmd . " " . a:target
  call ClearEchoAndExecute(full_command)
endfunction
