-- Golang

require'lspconfig'.gopls.setup{
  cmd = {DATA_PATH .. "/lsp_servers/go/gopls"},
  on_attach = require'lsp'.common_on_attach
}
