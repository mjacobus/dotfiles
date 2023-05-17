local alternative_file = require("lib/alternative_file")
-- lvim.lsp.buffer_mappings.normal_mode['<leader>q'] = { "<cmd>bdelete<cr>",  "Show documentation" }
-- lvim.keys.normal_mode["<leader>q"] = { "<cmd>bdelete<cr>", "close buffer" }

-- 'which_key' means prefixed by <leader>
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!", "Quit" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>bdelete<cr>", "close buffer" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>bdelete<cr>", "close buffer" }
lvim.builtin.which_key.mappings["bdd"] = { "<cmd>bdelete!<cr>", "close buffer!" }
lvim.builtin.which_key.mappings["bda"] = { "<cmd>bufdo %bd!<cr>", "close all buffers!" }

-- TODO: how to add more meaningful comments
lvim.keys.insert_mode["jj"] = "<ESC>"

-- This closes the terminal, I.E. after a test run
vim.keymap.set("n", '<leader>j', function()
  name = vim.api.nvim_buf_get_name(0)

  if string.find(name, "term://") then
    number = vim.api.nvim_buf_get_number(0)
    vim.api.nvim_exec('buffer #', true)
    vim.api.nvim_buf_delete(number, { force = true })
  end
end)

vim.keymap.set('n', '<leader>af', '<c-^>') -- alternative file

-- " Avoid arrow keys in command mode
vim.keymap.set('c', '<C-h>', '<left>')
vim.keymap.set('c', '<C-j>', '<down>')
vim.keymap.set('c', '<C-k>', '<up>')
vim.keymap.set('c', '<C-l>', '<right>')
vim.keymap.set('c', '<C-x>', '<del>')

vim.keymap.set('n', '<leader>ak', function()
  af.open('next', '--exists')
end)

vim.keymap.set('n', '<leader>aj', function()
  alternative_file.open('prev', '--exists')
end)
