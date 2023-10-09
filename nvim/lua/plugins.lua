local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    -- Fix html highlighting. See 'https://github.com/folke/tokyonight.nvim/issues/250#issuecomment-1324082607'
    commit = '9bfaf62e42bdcd042df1230e9188487e62a112c0'
  }
  use {
    'williamboman/mason.nvim',
    tag = 'v1.8.0'
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    commit = '31d8ed0'
  }
  use {
    'neovim/nvim-lspconfig',
    tag = 'v0.1.6'
  }
  use {
    'L3MON4D3/LuaSnip',
    commit = '5570fd7'
  }
  use {
    'onsails/lspkind-nvim',
    commit = 'c68b3a0'
  }
  use {
    'hrsh7th/cmp-buffer',
    commit = '3022dbc'
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    commit = '5922477'
  }
  use {
    'hrsh7th/nvim-cmp',
    commit = 'e55033f'
  }
  use {
    'glepnir/lspsaga.nvim',
    commit = 'b7b4777'
  }
  use {
    'creativenull/efmls-configs-nvim',
    tag = 'v1.1.1',
    requires = { 'neovim/nvim-lspconfig' },
  }

  use {
    'windwp/nvim-autopairs',
    commit = '03580d7'
  }
  use {
    'windwp/nvim-ts-autotag',
    commit = 'fdefe46'
  }

  use {
    'Mofiqul/vscode.nvim',
    commit = 'c5125820a0915ef50f03fae10423c43dc49c66b1'
  }

  use {
    'nvim-lualine/lualine.nvim',
    commit = 'fffbcb8',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
    'nvim-telescope/telescope.nvim',
    commit = 'e960efa',
    requires = { { 'nvim-lua/plenary.nvim', commit = '4b7e520' } }
  }

  use {
    'airblade/vim-gitgutter',
    commit = '00df108'
  }

  use {
    'bkad/CamelCaseMotion',
    commit = 'de439d7'
  }

  use {
    'tpope/vim-surround',
    commit = '3d188ed'
  }

  use {
    'tpope/vim-unimpaired',
    commit = '6d44a6d'
  }

  use {
    'tpope/vim-eunuch',
    commit = '291ef1f'
  }

  use {
    'tpope/vim-fugitive',
    commit = '5b0b138'
  }

  use {
    'tpope/vim-commentary',
    commit = 'e87cd90'
  }

  use {
    'mattn/emmet-vim',
    commit = 'def5d57'
  }

  use {
    'theprimeagen/harpoon',
    commit = '21d0d1b'
  }

  use {
    'folke/zen-mode.nvim',
    commit = '6e6c963d70a8e47854fa656987666bfb863f9c4e'
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
