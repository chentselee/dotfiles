require "nvim-treesitter.configs".setup {
  -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
  ensure_installed = "maintained",
  highlight = {
    -- enable highlighting for all file types
    enable = true -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
  },
  indent = {
    enable = false
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
