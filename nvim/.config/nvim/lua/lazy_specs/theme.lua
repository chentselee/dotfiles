return {
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    config = function()
      require('vscode').setup({
        style = 'dark',
        transparent = true,
      })
      vim.cmd.colorscheme 'vscode'
      require('vscode').load()
    end,
  }
}
