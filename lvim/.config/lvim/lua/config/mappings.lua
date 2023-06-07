local alternative_file = require("lib/alternative_file")
-- lvim.lsp.buffer_mappings.normal_mode['<leader>q'] = { "<cmd>bdelete<cr>",  "Show documentation" }
-- lvim.keys.normal_mode["<leader>q"] = { "<cmd>bdelete<cr>", "close buffer" }

-- 'which_key' means prefixed by <leader>
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<cr>", "Quit" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>bdelete<cr>", "close buffer" }
lvim.builtin.which_key.mappings["bdd"] = { "<cmd>bdelete!<cr>", "close buffer!" }
lvim.builtin.which_key.mappings["bda"] = { "<cmd>bufdo %bd!<cr>", "close all buffers!" }
lvim.builtin.which_key.mappings.s.t = { "<cmd>:terminal ./shell_test<cr>", "Run shell_test" }

-- TODO: how to add more meaningful comments
lvim.keys.insert_mode["jj"] = "<ESC>"
-- lvim.keys.normal_mode["<leader>qq"] = ":q!<cr>" -- does not work
lvim.builtin.which_key.mappings.q.q = { "<cmd>:q!<cr>", "Quit force" }

-- This closes the terminal, I.E. after a test run
lvim.keys.normal_mode["<leader>j"] = function()
  local name = vim.api.nvim_buf_get_name(0)

  if string.find(name, "term://") then
    local number = vim.api.nvim_buf_get_number(0)
    vim.api.nvim_exec('buffer #', true)
    vim.api.nvim_buf_delete(number, { force = true })
  end
end

lvim.builtin.which_key.mappings.f = { '/', "Search alias" }
lvim.builtin.which_key.mappings.F = { '<cmd>nohlsearch<cr>', "Remove search highlight" }

lvim.keys.normal_mode['<leader>af'] = '<c-^>' -- alternative file

-- " Avoid arrow keys in command mode
vim.keymap.set('c', '<C-h>', '<left>')
vim.keymap.set('c', '<C-j>', '<down>')
vim.keymap.set('c', '<C-k>', '<up>')
vim.keymap.set('c', '<C-l>', '<right>')
vim.keymap.set('c', '<C-x>', '<del>')

lvim.keys.normal_mode["<leader>ak"] = function()
  alternative_file.open('next', '--exists')
end

lvim.keys.normal_mode["<leader>aj"] = function()
  alternative_file.open('prev', '--exists')
end


vim.diagnostic.config({ virtual_text = false })
