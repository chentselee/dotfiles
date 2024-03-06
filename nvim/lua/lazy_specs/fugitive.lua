return {
  {
    'tpope/vim-fugitive',
    commit = '5b0b138',
    config = function()
      vim.keymap.set('n', '<Leader>gg', '<cmd>Git<CR>', { silent = true })
      vim.keymap.set('n', '<Leader>gl', '<cmd>Git log --graph --oneline --decorate<CR>', { silent = true })
      vim.keymap.set('n', '<Leader>gb', '<cmd>Git blame<CR>', { silent = true })
    end,
  }
}
