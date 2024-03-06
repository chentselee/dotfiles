return {
  {
    'mattn/emmet-vim',
    commit = 'def5d57',
    config = function()
      vim.g.user_emmet_mode = 'i'
      vim.g.user_emmet_install_global = 0
      vim.cmd([[
      autocmd FileType html,css EmmetInstall
      ]])
    end,
  }
}
