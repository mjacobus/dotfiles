local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        -- null_ls.builtins.completion.rubocop,
        -- null_ls.builtins.completion.prettier,
    },
})

vim.keymap.set("n", "F", function() 
  vim.lsp.buf.format({ async = false })
  print("[LSP] formatted")
end)
