config = require('lspconfig')
require('lsp/ruby')
require('lsp/go')
completion = require('completion').on_attach
utils = require('utils')
inoremap = utils.inoremap
nnoremap = utils.nnoremap

-- Type script
config.tsserver.setup{ on_attach = completion }
-- Bash
config.bashls.setup{}

-- Javascript, I think https://github.com/denoland/deno
config.denols.setup{}

config.sumneko_lua.setup{}

config.gopls.setup{}

-- Autocomplete
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}


-- inoremap('<tab>', '<Plug>(completion_smart_tab)') -- conflicts with  ultisnippets
-- inoremap('<s-tab>', '<Plug>(completion_smart_s_tab)')
vim.api.nvim_exec('imap <silent> <c-p> <Plug>(completion_trigger)', true)
