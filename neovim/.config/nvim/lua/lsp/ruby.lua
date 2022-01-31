-- require'lspconfig'.solargraph.setup{ on_attach = require('completion').on_attach }
-- require'lspconfig'.solargraph.setup{ on_attach = require'lsp'.common_on_attach }

require'lspconfig'.solargraph.setup {
    -- cmd = { DATA_PATH .. "~/.rbenv/shims/solargraph", "--stdio" },
    on_attach = require'lsp'.common_on_attach,
    -- on_attach = require'completion'.on_attach,
    -- handlers = {
    --     ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    --         virtual_text = O.ruby.diagnostics.virtual_text,
    --         signs = O.ruby.diagnostics.signs,
    --         underline = O.ruby.diagnostics.underline,
    --         update_in_insert = true
    --
    --     })
    -- },
    -- filetypes = O.ruby.filetypes,
}

-- disable ruby completion
vimp.nnoremap('<leader>dr', function()
  local disable_warnings = function(_, bufnr)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- disable virtual text
      virtual_text = false,

      -- show signs
      signs = false,

      -- delay update diagnostics
      update_in_insert = false,
    }
    )
  end

  require('lspconfig').solargraph.setup{ on_attach = disable_warnings }
  print('Annoying warnings disabled')
end)



