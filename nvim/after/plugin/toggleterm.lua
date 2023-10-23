local status, toggleterm = pcall(require, 'toggleterm')
if (not status) then return end

toggleterm.setup {}

local Terminal = require('toggleterm.terminal').Terminal

local terminal = Terminal:new({
  direction = 'float',
  hidden = true,
})
function TerminalToggle()
  terminal:toggle()
end

vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua TerminalToggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-t>", "<cmd>lua TerminalToggle()<CR>", { noremap = true, silent = true })

local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = 'float',
  hidden = true,
  float_opts = {
    height = 40,
  },
})
function LazygitToggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<Leader>l", "<cmd>lua LazygitToggle()<CR>", { noremap = true, silent = true })
