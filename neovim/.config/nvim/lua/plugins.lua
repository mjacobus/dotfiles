-- Plugins managed by packer: https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require('settings.telescope')]]
  }

  use {
    'mattn/gist-vim',
    requires = {{'mattn/webapi-vim'}}
  }

  use { 'mjacobus/vim-snippets', requires = {{ 'sirver/ultisnips' }}}

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[require('settings.indentline')]]
  }

  use  {
    "svermeulen/vimpeccable"
    -- requires = {{ 'svermeulen/vimpeccable-lua-vimrc-example', 'morhetz/gruvbox' }}
  } -- dsl for mappings
  use 'thalesmello/lkml.vim'
  use 'mhartington/oceanic-next'
  use 'elixir-editors/vim-elixir'
  use 'yukunlin/auto-pairs'
  use 'Lokaltog/vim-easymotion'
  use 'austintaylor/vim-commaobject'
  use 'kana/vim-textobj-user'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-surround'
  use 'mechatroner/rainbow_csv'
  use 'mattn/emmet-vim'
  use 'othree/html5.vim'
  use {
    'tyru/open-browser-github.vim',
    requires = {{'tyru/open-browser.vim'}}
  }
  use {
    'neovim/nvim-lspconfig',
    config = [[require('settings.lsp')]]
  }
  use 'folke/tokyonight.nvim'
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = [[require('settings.vim-tree')]]
  -- }
  use 'nvim-lua/completion-nvim'
  use 'rking/ag.vim'
  use 'weierophinney/argumentrewrap'
  use 'tpope/vim-eunuch'
  use {
    'scrooloose/nerdtree',
    config = [[require('settings.nerdtree')]]
  }

  use 'godlygeek/tabular'
  use {
    'tpope/vim-fugitive',
    config = [[require('settings.fugitive')]]
  }
  -- use 'hrsh7th/vim-vsnip' -- check out

  use { 
    'iamcco/markdown-preview.nvim', 
    run = 'cd app && npm install'
  }

  use {
    -- 'junegunn/fzf',  run = './install --all',
    'junegunn/fzf',
    run = [[ :call fzf#install() ]],
    config = [[require('settings.fzf')]],
    requires = { 'junegunn/fzf.vim' }
  }

  -- ruby
  use 'noprompt/vim-yardoc'
  use 'hallison/vim-rdoc'
  use 'pwntester/octo.nvim'

  -- Do I want them?
  --     source ~/.vim/plugins/indentation-guides.vim
  --     source ~/.vim/plugins/lightline.vim
  --     source ~/.vim/plugins/syntastic.vim
  --     source ~/.vim/plugins/ultisnipts.vim
  --     source ~/.vim/plugins/vim-test.vim
  --     " source ~/.vim/plugins/php.vim
  --     source ~/.vim/plugins/ruby.vim
  --     source ~/.vim/plugins/javascript.vim
  --     " Plug 'airblade/vim-gitgutter'
  --     " Plug 'slim-template/vim-slim'
  --     " Plug 'jparise/vim-graphql'
  --     Plug 'othree/html5.vim'
end)
