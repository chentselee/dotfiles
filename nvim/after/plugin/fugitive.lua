vim.keymap.set('n', '<Leader>gg', '<cmd>Git<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>gl', '<cmd>Git log --graph --oneline --decorate<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>gb', '<cmd>Git blame<CR>', { noremap = true, silent = true })
