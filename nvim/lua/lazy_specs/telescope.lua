return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require('telescope').setup()
      pcall(require('telescope').load_extension, 'fzf')
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>th', builtin.builtin)
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
      vim.keymap.set('n', '<leader>ff', builtin.git_files)
      vim.keymap.set('n', '<leader>fs', builtin.find_files)
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
      vim.keymap.set('n', '<leader><leader>', builtin.buffers)
      vim.keymap.set('n', '<leader>fm', builtin.marks)
      vim.keymap.set('n', '<leader>rg', builtin.live_grep)
      vim.keymap.set('v', '<leader>gs', builtin.grep_string)
      vim.keymap.set('n', '<leader>cs', builtin.colorscheme)
      vim.keymap.set('n', '<leader>km', builtin.keymaps)
    end,
  }
}
