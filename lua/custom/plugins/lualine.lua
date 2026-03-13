return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local gruvbox = require 'lualine.themes.gruvbox'
    require('lualine').setup {
      options = {
        theme = gruvbox,
      },
    }
  end,
}
