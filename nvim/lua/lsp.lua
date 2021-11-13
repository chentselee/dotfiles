-- lsp setup
-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      prefix = "",
      spacing = 0
    },
    signs = true,
    underline = true
  }
)

-- -- uncomment below to enable nerd-font based icons for diagnostics in the
-- -- gutter, see:
-- -- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter
local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " P (Property)",
  "   (Unit)",
  "   (Value)",
  " E (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)"
}

local prettier = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
  env = {
    "PRETTIERD_LOCAL_PRETTIER_ONLY=true",
    string.format(
      "PRETTIERD_DEFAULT_CONFIG=%s",
      vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json")
    )
  }
}

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local luafmt = {
  formatCommand = "luafmt -i 2 -l 80 --stdin",
  formatStdin = true
}

local servers = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {"vim"}
        }
      }
    }
  },
  typescript = {},
  css = {},
  go = {},
  rust = {},
  svelte = {},
  html = {
    filetypes = {"html"}
  },
  tailwindcss = {},
  efm = {
    init_options = {documentFormatting = true},
    filetypes = {
      "html",
      "css",
      "scss",
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "json",
      "lua"
    },
    settings = {
      languages = {
        html = {prettier},
        css = {prettier},
        scss = {prettier},
        javascript = {eslint_d, prettier},
        typescript = {eslint_d, prettier},
        javascriptreact = {eslint_d, prettier},
        typescriptreact = {eslint_d, prettier},
        json = {prettier},
        lua = {luafmt}
      }
    }
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup_servers()
  require "lspinstall".setup()
  for server, config in pairs(servers) do
    require "lspconfig"[server].setup(
      vim.tbl_deep_extend("force", {capabilities = capabilities}, config)
    )
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
