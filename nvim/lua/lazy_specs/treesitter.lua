return {
  {
    'nvim-treesitter/nvim-treesitter',
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
          'svelte',
          'c',
          'zig',
          'elixir',
          'eex',
          'heex',
          'jsdoc',
          'gitignore',
          'gitattributes',
          'json',
          'yaml',
          'toml',
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
