local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })


  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");
  use('lewis6991/gitsigns.nvim')

  -- my old plugins
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-surround'
  use 'mattn/emmet-vim'
  use 'yukunlin/auto-pairs'
  use { 'mattn/gist-vim', requires = {{'mattn/webapi-vim'}} }
  use 'rking/ag.vim'
  use 'weierophinney/argumentrewrap'
  use 'tpope/vim-eunuch'
  use 'scrooloose/nerdtree'
  use 'Lokaltog/vim-easymotion'

  -- javascript
  use 'kchmck/vim-coffee-script'
  -- Should use it?
  -- Plug 'HerringtonDarkholme/yats.vim'
  -- Plug 'pangloss/vim-javascript'
  -- Plug 'MaxMEllon/vim-jsx-pretty'
  -- Plug 'styled-components/vim-styled-components'
  -- Plug 'elzr/vim-json'
  -- Plug 'jparise/vim-graphql'

  -- colors
  use 'mhartington/oceanic-next'
  use 'chriskempson/base16-vim'
  use 'drewtempelmeyer/palenight.vim'
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'patstockwell/vim-monokai-tasty'
  use 'kartikp10/noctis.nvim'
  use 'Almo7aya/neogruvbox.nvim'
  use { 'nocksock/bloop.nvim', requires = {{ 'rktjmp/lush.nvim' }} }
  use 'aswathkk/DarkScene.vim'

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

end)
