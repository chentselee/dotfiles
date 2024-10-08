return {
  {
    'nvim-lualine/lualine.nvim',
    commit       = 'fffbcb8',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config       = function()
      local lualine = require('lualine')
      local colors = {
        blue = '#51afef'
      }
      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
      }
      local codedark = require('lualine.themes.codedark')
      codedark.normal.c.bg = '#18181b'
      local config = {
        options = {
          theme = codedark,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              function()
                return "▊"
              end,
              color = { fg = colors.blue },
              padding = { left = 0 },
            },
            {
              'branch',
              icon = '',
            },
            {
              'diff',
              symbols = { added = ' ', modified = ' ', removed = ' ' },
            },
          },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = ' ', warn = ' ', info = ' ' },
            },
            {
              'filetype',
              icon_only = true,
              cond = conditions.buffer_not_empty
            },
            {
              'filename',
              padding = { left = 0, right = 1 },
              cond = conditions.buffer_not_empty
            },
            'progress',
            {
              'o:encoding',
              fmt = string.upper
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {
            {
              'filetype',
              icon_only = true,
              cond = conditions.buffer_not_empty
            },
            {
              'filename',
              padding = { left = 0, right = 1 },
              cond = conditions.buffer_not_empty
            },
          },
          lualine_y = {},
          lualine_z = {},
        }
      }
      lualine.setup(config)
    end,
  },
}
