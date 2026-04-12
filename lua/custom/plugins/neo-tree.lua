-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'folke/snacks.nvim',
  },
  lazy = false,
  keys = {},
  opts = {},
  config = function()
    require('nvim-web-devicons').setup {

      window = {
        position = 'float',
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
    }

    vim.keymap.set('n', '\\', function()
      if vim.bo.filetype == 'neo-tree' then
        vim.cmd 'Neotree close'
      else
        vim.cmd 'Neotree float'
      end
    end, { desc = 'toggle NeoTree' })
  end,
}
