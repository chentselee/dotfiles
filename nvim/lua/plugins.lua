local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master'
  }
  use {
    'williamboman/mason.nvim',
    branch = 'main'
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    branch = 'main'
  }
  use {
    'neovim/nvim-lspconfig',
    branch = 'master'
  }
  use {
    'L3MON4D3/LuaSnip',
    branch = 'master'
  }
  use {
    'onsails/lspkind-nvim',
    branch = 'master'
  }
  use {
    'hrsh7th/cmp-buffer',
    branch = 'main'
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    branch = 'main'
  }
  use {
    'hrsh7th/nvim-cmp',
    branch = 'main'
  }
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main'
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    branch = '0.7-compat'
  }
  use {
    'MunifTanjim/prettier.nvim',
    branch = 'main'
  }

  use {
    'windwp/nvim-autopairs',
    branch = 'master'
  }
  use {
    'windwp/nvim-ts-autotag',
    branch = 'main'
  }

  use {
    'Mofiqul/vscode.nvim',
    -- branch = 'main'
    commit = "c5125820a0915ef50f03fae10423c43dc49c66b1"
  }

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
