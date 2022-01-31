function! c#CompileAndRunCurrentCFile()
  let file = expand('%')
  let binary = substitute(file, "\.c$", ".o", "")
  let command = "gcc " . file . " -o " . binary . " && ./" . binary
  call ExecuteCommand(command)
endfunction

