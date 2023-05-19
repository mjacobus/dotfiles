-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

require("config.mappings")

lvim.plugins                             = require("config.plugins")
lvim.builtin.treesitter.ensure_installed = {}
lvim.format_on_save.enabled              = true
lvim.format_on_save.pattern              = {}


require("config.ides").setup(
  lvim,
  {
    require("config.ide.python"),
    require("config.ide.lua"),
    require("config.ide.php")
  }
)
