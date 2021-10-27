return require("packer").startup {
  function()
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"

    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "glepnir/lspsaga.nvim"
    use "hrsh7th/nvim-compe"
    use {"nvim-treesitter/nvim-treesitter", config = {run = ":TSUpdate"}}
    use "nvim-treesitter/nvim-treesitter-textobjects"

    use {"glepnir/galaxyline.nvim", {branch = "main"}}
    -- needed for galaxyline icons
    use "kyazdani42/nvim-web-devicons"
    use "mattn/emmet-vim"
    use "tpope/vim-surround"
    use "tpope/vim-unimpaired"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"
    use "tomtom/tcomment_vim"
    use "bkad/CamelCaseMotion"
    use "jiangmiao/auto-pairs"

    use "NLKNguyen/papercolor-theme"
  end
}
