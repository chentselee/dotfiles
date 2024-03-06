return {
  {
    'Mofiqul/vscode.nvim',
    commit = 'c5125820a0915ef50f03fae10423c43dc49c66b1',
    lazy = false,
    config = function()
      vim.g.vscode_style = "dark"
      vim.g.vscode_transparent = 1
      vim.cmd.colorscheme 'vscode'
    end,
  }
}
