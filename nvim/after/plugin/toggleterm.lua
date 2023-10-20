local status, toggleterm = pcall(require, 'toggleterm')
if (not status) then return end

toggleterm.setup {
  open_mapping = [[<Leader>t]],
  direction = 'float',
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
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
