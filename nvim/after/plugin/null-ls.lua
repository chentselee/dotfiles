local status, null_ls = pcall(require, 'null-ls')

if (not status) then return end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.code_actions.eslint_d
  }
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd([[
      autocmd BufWritePost <buffer> lua vim.lsp.buf.format { filter = function(client) return client.name ~= "tsserver" end }
      ]])
    end
  end
}
