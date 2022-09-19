local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-treesitter/nvim-treesitter'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'glepnir/lspsaga.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'Mofiqul/vscode.nvim'

  use({
    "glepnir/galaxyline.nvim",
    branch = 'main',
    config = function()
      require("statusbar")
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  })

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'airblade/vim-gitgutter'
  use 'bkad/CamelCaseMotion'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'mattn/emmet-vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
