local M = {}
local tables = require("lib/tables")

M.add = function(lvim, ide)
  vim.list_extend(lvim.plugins, ide.plugins)
  vim.list_extend(lvim.format_on_save.pattern, ide.format_on_save.pattern)
  vim.list_extend(
    lvim.builtin.treesitter.ensure_installed,
    ide.treesitter.ensure_installed
  )

  ide.setup()
end

M.setup = function(lvim, ides)
  for _, ide in ipairs(ides) do
    M.add(lvim, ide)
  end
end

return M
