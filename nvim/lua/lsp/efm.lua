local eslint_d = require('efmls-configs.linters.eslint_d')
local prettier_d = require('efmls-configs.formatters.prettier_d')
local beautysh = require('efmls-configs.formatters.beautysh')

local languages = {
  html = { prettier_d },
  javascript = { eslint_d, prettier_d },
  javascriptreact = { eslint_d, prettier_d },
  typescript = { eslint_d, prettier_d },
  typescriptreact = { eslint_d, prettier_d },
  svelte = { prettier_d },
  template = { prettier_d },
  astro = { eslint_d, prettier_d },
  sh = { beautysh },
}

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
  -- Pass your custom lsp config below like on_attach and capabilities
  -- on_attach = on_attach,
  -- capabilities = capabilities,
}))
