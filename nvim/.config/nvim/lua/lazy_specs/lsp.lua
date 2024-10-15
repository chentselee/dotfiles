return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      {
        'nvimdev/lspsaga.nvim',
        config = function()
          require('lspsaga').setup()
        end
      },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local nmap = function(key, func)
            vim.keymap.set('n', key, func, { buffer = event.buf })
          end
          nmap('gd', require('telescope.builtin').lsp_definitions)
          nmap('gr', require('telescope.builtin').lsp_references)
          nmap('gi', require('telescope.builtin').lsp_implementations)
          nmap('gt', require('telescope.builtin').lsp_type_definitions)
          nmap('gS', require('telescope.builtin').lsp_document_symbols)
          nmap('<leader>rn', vim.lsp.buf.rename)
          nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>')
          nmap('K', '<cmd>Lspsaga hover_doc<CR>')
          nmap('<C-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>')
          nmap('<C-k>', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
          nmap('gD', vim.lsp.buf.declaration)
        end
      })
      -- cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local lspconfig = require('lspconfig')
      local servers = {
        -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
        ts_ls = {
          single_file_support = false,
        },
        denols = {
          root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
        },
        gopls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
                -- If lua_ls is really slow on your computer, you can try this instead:
                -- library = { vim.env.VIMRUNTIME },
              },
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }
      require('mason').setup()
      local ensure_installed = vim.tbl_keys(servers or {})
      -- mason can install not just lsps
      vim.list_extend(ensure_installed, {
        'stylua',
      })
      require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })
      -- auto format
      vim.cmd([[
      autocmd BufWritePre * :lua vim.lsp.buf.format { filter = function(client) return client.name ~= "tsserver" and client.name ~= "svelte" end }
      ]])
    end,
  },
  {
    'creativenull/efmls-configs-nvim',
    dependencies = {
      'neovim/nvim-lspconfig'
    },
    config = function()
      local eslint_d_linter = require('efmls-configs.linters.eslint_d')
      local eslint_d_formatter = require('efmls-configs.formatters.eslint_d')
      local prettier_d = require('efmls-configs.formatters.prettier_d')
      local beautysh = require('efmls-configs.formatters.beautysh')

      local languages = {
        html = { prettier_d },
        javascript = { eslint_d_linter, eslint_d_formatter, prettier_d },
        javascriptreact = { eslint_d_linter, eslint_d_formatter, prettier_d },
        typescript = { eslint_d_linter, eslint_d_formatter, prettier_d },
        typescriptreact = { eslint_d_linter, eslint_d_formatter, prettier_d },
        svelte = { prettier_d },
        template = { prettier_d },
        astro = { eslint_d_linter, eslint_d_formatter, prettier_d },
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
    end
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      luasnip.config.setup({})
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
          }),
          ['<C-e>'] = cmp.mapping.complete(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })
    end,
  }
}
