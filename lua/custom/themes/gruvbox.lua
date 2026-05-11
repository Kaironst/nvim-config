return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = '',  -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    }
    vim.cmd 'colorscheme gruvbox'


    --Sets dashboard theme
    local dashboard = require 'alpha.themes.dashboard'
    -- available: devicons, mini, default is mini
    -- if provider not loaded and enabled is true, it will try to use another provider
    -- dashboard.file_icons.provider = 'devicons'


    dashboard.section.buttons.val = {
      dashboard.button("t", "  Open Terminal", ":te<CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
    }

    dashboard.section.header.opts.hl = 'AlphaHeader'
    require('alpha').setup(dashboard.config)


    --lualine theme
    require('lualine').setup {
      options = {
        theme = 'auto',
      }
    }

    --barbar
    require "barbar".setup {

    }
  end,
}
