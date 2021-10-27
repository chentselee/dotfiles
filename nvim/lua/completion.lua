local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup(
  {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<C-y>"] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ["<CR>"] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp"},
        {name = "vsnip"}
      },
      {
        {name = "buffer"}
      },
      {
        {name = "path"}
      }
    ),
    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          path = "[path]",
          vsnip = "[snip]"
        },
        symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﴲ",
          Variable = "[]",
          Class = "",
          Interface = "ﰮ",
          Module = "",
          Property = "P",
          Unit = "",
          Value = "",
          Enum = "E",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "ﲀ",
          Struct = "ﳤ",
          Event = "",
          Operator = "",
          TypeParameter = ""
        }
      }
    }
  }
)

local capabilities =
  require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
require("lspconfig")["typescript"].setup {
  capabilities = capabilities
}
