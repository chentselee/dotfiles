local treesitter_parser_config = require "nvim-treesitter.parsers".get_parser_configs()
treesitter_parser_config.templ = {
  install_info = {
    url = "https://github.com/vrischmann/tree-sitter-templ.git",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "master",
  },
}
vim.treesitter.language.register('templ', 'templ')

require "nvim-treesitter.configs".setup {
  -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
  ensure_installed = "all",
  ignore_install = { "haskell", "phpdoc" },
  highlight = {
    -- enable highlighting for all file types
    enable = true -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
  },
  indent = {
    enable = false
  },
}
