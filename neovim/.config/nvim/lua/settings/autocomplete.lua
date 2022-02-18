 -- Setup nvim-cmp.
 local cmp = require'cmp'

 cmp.setup({
   snippet = {
     -- REQUIRED - you must specify a snippet engine
     expand = function(args)
       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
       -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
       -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
       vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
     end,
   },
   mapping = {
     ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
     ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
     ['<C-e>'] = cmp.mapping({
       i = cmp.mapping.abort(),
       c = cmp.mapping.close(),
     }),
     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
     ["<c-y>"] = cmp.mapping(
     cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Insert,
       select = true,
     },
     { "i", "c" }
     ),

   },
   sources = cmp.config.sources({
     { name = 'nvim_lsp' },
     { name = 'ultisnips' },
     { name = 'buffer', keyword_length = 3 },
     { name = 'path' },
   })
 })

 -- Set configuration for specific filetype.
 cmp.setup.filetype('gitcommit', {
   sources = cmp.config.sources({
     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
   }, {
     { name = 'buffer' },
   })
 })

 -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline('/', {
   sources = {
     { name = 'buffer' }
   }
 })

 -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline(':', {
   sources = cmp.config.sources({
     { name = 'path' }
   }, {
     { name = 'cmdline' }
   })
 })

 -- Setup lspconfig.
 local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
--  }
require 'lsp.go'
require 'lsp.ruby'

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
