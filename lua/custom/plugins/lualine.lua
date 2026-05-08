return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local gruvbox = require 'lualine.themes.gruvbox'
    local auto = require 'lualine.themes.auto'
    require('lualine').setup {
      options = {
        theme = auto,
      },
    }
  end,
}
