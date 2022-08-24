local status, prettier = pcall(require, 'prettier')

if (not status) then return end

prettier.setup {
  bin = 'prettierd',
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
    'svelte',
    'vue'
  }
}
