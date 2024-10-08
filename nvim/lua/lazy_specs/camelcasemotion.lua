return {
  {
    'bkad/CamelCaseMotion',
    config = function()
      vim.keymap.set('n', '\\w', '<Plug>CamelCaseMotion_w', { noremap = true, silent = true })
      vim.keymap.set('n', 'c\\w', 'c<Plug>CamelCaseMotion_w', { noremap = true, silent = true })
      vim.keymap.set('n', 'd\\w', 'd<Plug>CamelCaseMotion_w', { noremap = true, silent = true })
      vim.keymap.set('n', '\\b', '<Plug>CamelCaseMotion_b', { noremap = true, silent = true })
      vim.keymap.set('n', 'c\\b', 'c<Plug>CamelCaseMotion_b', { noremap = true, silent = true })
      vim.keymap.set('n', 'd\\b', 'd<Plug>CamelCaseMotion_b', { noremap = true, silent = true })
      vim.keymap.set('n', '\\e', '<Plug>CamelCaseMotion_e', { noremap = true, silent = true })
      vim.keymap.set('n', 'c\\e', 'c<Plug>CamelCaseMotion_e', { noremap = true, silent = true })
      vim.keymap.set('n', 'd\\e', 'd<Plug>CamelCaseMotion_e', { noremap = true, silent = true })
      vim.keymap.set('n', '\\ge', '<Plug>CamelCaseMotion_ge', { noremap = true, silent = true })
      vim.keymap.set('n', 'c\\ge', 'c<Plug>CamelCaseMotion_ge', { noremap = true, silent = true })
      vim.keymap.set('n', 'd\\ge', 'd<Plug>CamelCaseMotion_ge', { noremap = true, silent = true })
      vim.keymap.set('v', '\\w', '<Plug>CamelCaseMotion_w', { noremap = true, silent = true })
      vim.keymap.set('v', '\\b', '<Plug>CamelCaseMotion_b', { noremap = true, silent = true })
      vim.keymap.set('v', '\\e', '<Plug>CamelCaseMotion_e', { noremap = true, silent = true })
    end,
  }
}
