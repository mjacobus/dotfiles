-- Ruby IDE

local M = {}

M.plugins = {
  { "olimorris/neotest-rspec" },
}

M.treesitter = {
  ensure_installed = { "ruby" }
}

M.format_on_save = {
  pattern = { "*.rb" }
}

M.setup = function()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    { command = "rubocop", filetypes = { "rb" } },
  }

  local lsp_manager = require("lvim.lsp.manager")
  lsp_manager.setup("solargraph")
end

return M
