-- see a list of servers here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
config = require('lspconfig')

-- Bash
config.bashls.setup{}

-- Javascript, I think https://github.com/denoland/deno
config.denols.setup{}

-- Type script
config.tsserver.setup{}

-- Golang
config.gopls.setup{}

-- Lua
config.sumneko_lua.setup{}

-- Ruby
config.solargraph.setup{}

-- PHP
config.phpactor.setup{}

-- GraphQL
config.graphql.setup{}

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
  local opts = {}

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
