-- Javascript IDE

local M = {}

M.plugins = {
}

M.treesitter = {
  ensure_installed = { "javascript" }
}

M.format_on_save = {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", ".css", ".scss", ".sass", ".mjs" }
}

M.setup = function()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    { command = "prettier", filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css" } },
  }

  local lsp_manager = require("lvim.lsp.manager")
  lsp_manager.setup("tsserver")
end

return M
