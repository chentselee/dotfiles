local status, mark = pcall(require, 'harpoon.mark')
if (not status) then return end
local status, ui = pcall(require, 'harpoon.ui')
if (not status) then return end

vim.keymap.set("n", "<Leader>ha", mark.add_file)
vim.keymap.set("n", "<Leader>e", ui.toggle_quick_menu)
vim.keymap.set("n", "<Leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<Leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<Leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<Leader>4", function() ui.nav_file(4) end)
