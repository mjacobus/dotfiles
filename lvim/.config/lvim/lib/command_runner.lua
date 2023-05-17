M = {}

M.run = function(cmd)
  print("cmd: " .. cmd)
  local f = io.popen(cmd)
  local s = f:read('*a')
  f:close()
  return s
end

return M
