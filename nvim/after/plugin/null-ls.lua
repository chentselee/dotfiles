local status, null_ls = pcall(require, 'null-ls')

if (not status) then return end

local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.eslint_d,
    formatting.prettierd.with({
      filetypes = {
        'html',
        'css',
        'scss',
        'less',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'vue',
        'svelte'
      }
    }),
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd([[
      autocmd BufWritePost <buffer> lua vim.lsp.buf.format { filter = function(client) return client.name ~= "tsserver" end }
      ]])
    end
  end
}
