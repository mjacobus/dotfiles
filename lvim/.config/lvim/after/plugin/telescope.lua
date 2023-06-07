local builtin = require('telescope.builtin')

local git_files = function()
  builtin.git_files({ show_untracked = true })
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pa', git_files, {})
vim.keymap.set('n', '<leader>pg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>P', ':Telescope git_files find_command=rg,--ignore,--files<cr>')

lvim.builtin.which_key.mappings.p.s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer fuzzy find" }
