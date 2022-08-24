local status, saga = pcall(require, 'lspsaga')

if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<leader>t', '<cmd>Lspsaga open_floaterm<CR>', opts)
vim.keymap.set('t', '<leader>t', '<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>', opts)
