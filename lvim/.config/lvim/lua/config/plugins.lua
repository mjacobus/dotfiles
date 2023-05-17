lvim.plugins = {
  -- Colorschemes
  { 'mhartington/oceanic-next' },
  { 'folke/tokyonight.nvim' },
  { 'chriskempson/vim-tomorrow-theme' },
  { 'jlanzarotta/colorSchemeExplorer' },

  -- misc
  { 'tpope/vim-surround' },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-fugitive' },
  { 'Lokaltog/vim-easymotion' },
  {
    'mattn/gist-vim',
    dependencies = { { 'mattn/webapi-vim' } }
  },
  { "folke/zen-mode.nvim" },

  -- github
  -- { 'pwntester/octo.nvim'},
  {
    'tyru/open-browser-github.vim',
    dependencies = { { 'tyru/open-browser.vim' } }
  },

  -- { "folke/trouble.nvim" }, -- @see gh page,
  -- { "nvim-treesitter/nvim-treesitter-context" }, -- keep the function name at the top of the file
  -- { "theprimeagen/harpoon" },
  -- { "theprimeagen/refactoring.nvim" },
  -- { "mbbill/undotree" },

  -- my old plugins
  -- { 'tpope/vim-repeat' },
  -- { 'tpope/vim-speeddating' },
  -- { 'tpope/vim-rails' },
  -- { 'mattn/emmet-vim' },
  -- { 'rking/ag.vim' },
  -- { 'weierophinney/argumentrewrap' },
  -- { 'godlygeek/tabular' },
  -- { 'mjacobus/vim-snippets',  dependencies = { { 'sirver/ultisnips' } } },
  -- { 'austintaylor/vim-commaobject' },
  -- { 'mechatroner/rainbow_csv' },

  -- ruby
  -- { 'noprompt/vim-yardoc' }
  -- { 'hallison/vim-rdoc' },

  -- javascript
  -- { 'kchmck/vim-coffee-script' },
  -- Should use it?
  -- { 'HerringtonDarkholme/yats.vim' },
  -- { 'pangloss/vim-javascript' },
  -- { 'MaxMEllon/vim-jsx-pretty' },
  -- { 'styled-components/vim-styled-components' },
  -- { 'elzr/vim-json' },
  -- { 'jparise/vim-graphql' },

  -- colors @see https://vimcolorschemes.com/
  -- { 'mhartington/oceanic-next' },
  -- { 'chriskempson/base16-vim' },
  -- { 'drewtempelmeyer/palenight.vim' },
  -- { 'folke/tokyonight.nvim' },
  -- { { "catppuccin/nvim", as = "catppuccin" } },
  -- { 'patstockwell/vim-monokai-tasty' },
  -- { 'kartikp10/noctis.nvim' },
  -- { 'Almo7aya/neogruvbox.nvim' },
  -- { 'nocksock/bloop.nvim', dependencies = { { 'rktjmp/lush.nvim' } } },
  -- { 'aswathkk/DarkScene.vim' },
  -- { 'Mofiqul/vscode.nvim' },
  -- { "github/copilot.vim" },
  -- { "eandrju/cellular-automaton.nvim" },
  -- { "laytan/cloak.nvim" },

  -- LSP add ons
  -- Autocompletion
  -- { 'hrsh7th/nvim-cmp' },
  -- { 'saadparwaiz1/cmp_luasnip' },
  -- { 'quangnguyen30192/cmp-nvim-ultisnips' },
  -- { 'hrsh7th/cmp-nvim-lsp' },
  -- { 'hrsh7th/cmp-nvim-lua' },
  -- Snippets
  -- { 'L3MON4D3/LuaSnip' },
  -- { 'rafamadriz/friendly-snippets' },
}
