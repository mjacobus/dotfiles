-- Lua IDE

local M = {}

M.plugins = {}

M.treesitter = {
  ensure_installed = { "lua" }
}

M.format_on_save = {
  pattern = { "*.lua" }
}

M.setup = function()
end

return M
