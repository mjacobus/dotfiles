-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

require("config.mappings")
local tables = require("lib/tables")
local python = require("config.ide.python")
local php = require("config.ide.php")

lvim.builtin.treesitter.ensure_installed = tables.combine(
  python.treesitter.ensure_installed,
  php.treesitter.ensure_installed
)

lvim.plugins = tables.combine(
  require("config.plugins"),
  python.plugins,
  php.plugins
)

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = tables.combine(
  python.format_on_save.pattern,
  php.format_on_save.pattern
)

python.setup()
php.setup()
