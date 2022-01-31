function! elixir#LintFile(target)
  let cmd = 'mix format '
  call ClearEchoAndExecute(cmd)
endfunction

