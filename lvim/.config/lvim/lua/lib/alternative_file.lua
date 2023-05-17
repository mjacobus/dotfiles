local runner = require("lib/command_runner")
M = {}

M.open = function(subcommand, options)
  file_path = vim.fn.expand('%')
  file_path = vim.fn.fnamemodify(file_path, ":~:.")
  files = mj_alternative_file(file_path, subcommand, options)
  files = vim.split(files, ' ')
  file = files[1]

  if file ~= '' then
    vim.api.nvim_command('e ' .. file)
  end
end

function mj_alternative_file(file, subcommand, options)
  local cmd = 'mj alternative_file ' .. subcommand .. ' ' .. file .. ' ' .. options
  return runner.run(cmd)
end

return M
