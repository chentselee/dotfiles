-- set leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- always use en
if string.match(string.lower(vim.loop.os_uname().sysname), "darwin") then
  vim.cmd([[
  language en_US
  ]])
end

-- line number
vim.opt.number = true
vim.opt.relativenumber = true
-- relative line number on command / absolute on insert
vim.cmd([[
augroup numberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup end
]])

-- allow mouse
vim.opt.mouse = 'a'

-- sync system clipboard
vim.opt.clipboard = 'unnamedplus'

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
-- clear highlight on esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- set signcolumn to be always on to prevent layout shift
vim.opt.signcolumn = 'yes'

-- decrease update time (mostly for GitGutter)
vim.opt.updatetime = 50

-- more sensible split direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- indentation & tab
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- don't show partial command
vim.opt.showcmd = false

-- scroll offset
vim.opt.scrolloff = 10

-- no guicursor
vim.opt.guicursor = ''

-- no swap
vim.opt.swapfile = false

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanked text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- netrw
vim.g.netrw_banner = 0
-- toggle netrw
vim.cmd([[
function! NetrwMapping()
  if &ft ==# "netrw"
    normal `Z
  else
    mark Z
    silent Explore
  endif
endfunction
]])
vim.keymap.set('n', '<leader>d', '<cmd>call NetrwMapping()<CR>')

-- toggle quickfix list
vim.keymap.set('n', '<C-q>', function()
  local win_id = vim.fn.getqflist({ winid = 0 }).winid
  vim.cmd(win_id > 0 and 'cclose' or 'copen')
end)

-- map
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')
vim.keymap.set('n', '<leader>s', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>:pwd<CR>')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- select all
vim.keymap.set('n', '<leader>a', 'ggVG')
-- search and replace under cursor
vim.keymap.set('n', '<C-s>', ':%s/<C-r><C-w>/<C-r><C-w>/g<left><left><left>')
vim.keymap.set('t', '<leader><esc>', '<C-\\><C-n>')

require("plugin")
require("filetype")
