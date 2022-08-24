local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "sumneko_lua" then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  end
  server:setup(opts)
end)

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
