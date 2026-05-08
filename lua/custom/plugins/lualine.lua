return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin-nvim',
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '', right = '' } } }, -- leave colors alone
        lualine_b = { { 'filename', color = { fg = '#33D4C4', bg = '#362921' }, separator = { left = '', right = '' } } }, -- grey background with cyan text
        lualine_c = {
          { 'branch', color = { fg = '#D90202', bg = '#bbbbbb' }, separator = { right = '' } },
          {
            'diff',
            colored = true,
            diff_color = {
              added = { fg = '#14DE2C', bg = '#bbbbbb' },
              modified = { fg = '#932CB0', bg = '#bbbbbb' },
              removed = { fg = '#D90202', bg = '#bbbbbb' },
            },
            separator = { right = '' },
          },
        }, -- white background with red text}
        lualine_x = { { 'encoding', color = { fg = 'D90202', bg = '#bbbbbb' }, separator = { left = '' } } }, -- white background with red text
        lualine_y = { { 'lsp_status', color = { fg = '#33D4C4', bg = '#362921' }, separator = { left = '' } } }, -- grey background with cyan text
        lualine_z = { { 'location', separator = { left = '', right = '' } } }, -- leave colors alone
      },
    }
  end,
}
