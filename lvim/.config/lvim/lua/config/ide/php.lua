-- PHP Ide
-- @see https://github.com/LunarVim/starter.lvim/blob/php-ide/config.lua
local M = {}

M.plugins = {
  { "olimorris/neotest-phpunit" }
}

M.treesitter = {
  ensure_installed = { "php" }
}

M.format_on_save = {
  pattern = { "*.php" }
}

M.setup = function()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    { command = "phpcsfixer", filetypes = { "php" } },
  }

  local lsp_manager = require("lvim.lsp.manager")
  lsp_manager.setup("intelephense")
end

return M
