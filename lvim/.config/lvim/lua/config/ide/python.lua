-- python IDE
-- -- @see https://github.com/LunarVim/starter.lvim/blob/python-ide/config.lua
-- -- @see https://www.youtube.com/watch?v=lUssfjNzGNg&ab_channel=chris%40machine

local M = {}

M.plugins = {
  { "AckslD/swenv.nvim" },
  { "stevearc/dressing.nvim" },
  { "nvim-neotest/neotest-python" },
}

M.treesitter = {
  ensure_installed = { "python" }
}

M.format_on_save = {
  pattern = { "*.py" }
}

M.setup = function()
  local formatters = require("lvim.lsp.null-ls.formatters")
  formatters.setup { { name = "black" } }

  local linters = require("lvim.lsp.null-ls.linters")

  linters.setup {
    {
      command = "flake8", args = { "--ignore=E203", filetypes = { "python" } }
    }
  }
end

return M
