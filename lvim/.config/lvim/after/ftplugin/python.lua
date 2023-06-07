local runner = require("lib/command_runner")

local execute = function()
  local file = vim.fn.expand('%')
  runner.run_in_terminal('python ' .. file)
end
vim.keymap.set("n", "<leader>x", execute, { buffer = true })
