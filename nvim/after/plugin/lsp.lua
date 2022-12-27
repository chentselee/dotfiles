require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end
})

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
}

local keymap = vim.api.nvim_set_keymap
local function nkeymap(key, map)
  keymap('n', key, map, { noremap = true })
end

-- auto format
vim.cmd([[
autocmd BufWritePre * :lua vim.lsp.buf.formatting_seq_sync()
]])

-- mappings
-- nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
-- nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
-- nkeymap('<leader>ca', ':lua vim.lsp.buf.code_action()<cr>')
-- nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
nkeymap('<leader>mf', ':lua vim.lsp.buf.formatting()<cr>')
nkeymap('<leader>Wa', ':lua vim.lsp.buf.add_workspace_folder()<cr>')
nkeymap('<leader>Wr', ':lua vim.lsp.buf.remove_workspace_folder()<cr>')
nkeymap('<leader>Wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>')
