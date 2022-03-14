-- https://github.com/nanotee/nvim-lua-guide

require('plugins')
require('vimp')
require('globals')

vim.g.mapleader = " "
vim.o.ignorecase = true
vim.o.hidden = true
vim.o.smartcase = true
vim.o.hidden = true
vim.o.background = "dark"
vim.wo.number = true
vim.wo.numberwidth = 2
vim.wo.wrap = false
vim.cmd([[colorscheme OceanicNext]])
vim.api.nvim_set_option('clipboard', 'unnamed')

vim.api.nvim_exec("source ~/.config/nvim/config.vim", true)

vimp.nnoremap('<leader>j', function()
  name = vim.api.nvim_buf_get_name(0)

  if string.find(name, "term://") then
    vim.api.nvim_exec('buffer #', true)
  else
    -- vim.api.nvim_exec('<cr>', true)
  end
end)

vimp.nnoremap('<leader>af', '<c-^>')

vimp.nnoremap('<leader>ak', function()
  open_mj_alternative_file('next', '--exists')
end)

vimp.nnoremap('<leader>aj', function()
  open_mj_alternative_file('prev', '--exists')
end)

function open_mj_alternative_file(subcommand, options)
  file_path = vim.fn.expand('%')
  files = mj_alternative_file(file_path, subcommand, options)
  files = vim.split(files, ' ')
  file = files[1]

  if file ~= '' then
    vim.api.nvim_command('e ' .. file)
  end
end

function mj_alternative_file(file, subcommand, options)
  local cmd = 'mj alternative_file ' .. subcommand .. ' ' .. file .. ' ' .. options
  return execute_command(cmd)
end

function execute_command(cmd)
  print("cmd: " .. cmd)
  local f = io.popen(cmd)
  local s = f:read('*a')
  f:close()
  return s
end
