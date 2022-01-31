local nnoremap = function(mapping, command)
  vim.api.nvim_set_keymap('n', mapping, command, { noremap = true })
end

local inoremap = function(mapping, command)
  vim.api.nvim_set_keymap('i', mapping, command, { noremap = true })
end

return {
  nnoremap = nnoremap,
  inoremap = inoremap,
}
