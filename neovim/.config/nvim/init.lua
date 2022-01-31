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
