require("mason").setup()
require("mason-lspconfig").setup()
-- default lspconfig
require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end
})
-- custom lsp configs
require("lsp.efm")

-- auto format
vim.cmd([[
autocmd BufWritePre * :lua vim.lsp.buf.format { filter = function(client) return client.name ~= "tsserver" and client.name ~= "svelte" end }
]])

-- mappings
local keymap = vim.api.nvim_set_keymap
local function nkeymap(key, map)
  keymap('n', key, map, { noremap = true })
end
-- nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
-- nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
-- nkeymap('<leader>ca', ':lua vim.lsp.buf.code_action()<cr>')
-- nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
nkeymap('<leader>mf', ':lua vim.lsp.buf.format { filter = function(client) return client.name ~= "tsserver" end }<cr>')
nkeymap('<leader>Wa', ':lua vim.lsp.buf.add_workspace_folder()<cr>')
nkeymap('<leader>Wr', ':lua vim.lsp.buf.remove_workspace_folder()<cr>')
nkeymap('<leader>Wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>')
