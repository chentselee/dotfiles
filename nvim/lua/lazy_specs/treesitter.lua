return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- Fix html highlighting. See 'https://github.com/folke/tokyonight.nvim/issues/250#issuecomment-1324082607'
    commit = '9bfaf62e42bdcd042df1230e9188487e62a112c0',
    dependencies = {
      'vrischmann/tree-sitter-templ',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
        ensure_installed = {
          'vim',
          'lua',
          'html',
          'css',
          'javascript',
          'typescript',
          'tsx',
          'go',
          'json',
          'yaml',
          'markdown',
          'markdown_inline',
          'sql',
        },
        highlight = { enable = true },
        indent = { enable = false },
      }
    end,
  },
}