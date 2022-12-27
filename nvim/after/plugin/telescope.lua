local keymap = vim.api.nvim_set_keymap
local function nkeymap(key, map)
  keymap('n', key, map, { noremap = true })
end

nkeymap('<leader>pp', "<cmd>lua require'telescope.builtin'.builtin{}<CR>")
nkeymap('<leader>fr', "<cmd>lua require'telescope.builtin'.oldfiles{}<CR>")
nkeymap('<leader>fb', "<cmd>lua require'telescope.builtin'.buffers{}<CR>")
nkeymap('<leader>/', "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>")
nkeymap('<leader>fm', "<cmd>lua require'telescope.builtin'.marks{}<CR>")
nkeymap('<leader>ff', "<cmd>lua require'telescope.builtin'.git_files{}<CR>")
nkeymap('<leader>fs', "<cmd>lua require'telescope.builtin'.find_files{}<CR>")
nkeymap('<leader>rg', "<cmd>lua require'telescope.builtin'.live_grep{}<CR>")
nkeymap('<leader>cs', "<cmd>lua require'telescope.builtin'.colorscheme{}<CR>")
