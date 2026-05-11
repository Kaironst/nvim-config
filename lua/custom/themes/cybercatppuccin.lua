return {
  'https://github.com/catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.2,
      },
      default_integrations = true,
      integrations = {
        gitsigns = true,
        neotree = true,
        treesitter = true,
        barbar = true,
        telescope = true,
        mason = true,
        mini = {
          enabled = true,
        },
        which_key = true,
      },
      color_overrides = {
        all = {
          -- selection highlight / accent
          rosewater = "#9600e6",
          -- secondary accent
          flamingo = "#ffff00",
          -- ui emphasis
          pink = "#9600e6",
          -- Visiual mode, new files, changed file folders, return and function keywords.
          mauve = "#ff8000",
          -- Color of replace mode.
          red = "#2266cc",
          -- error-like emphasis
          maroon = "#9600e6",
          -- Booleans and integers
          peach = "#cc0000",
          -- Color of git changes and unsaved files
          yellow = "#cc0000",
          -- Insert mode, string, added color on the side bar
          green = "#00cc00",
          teal = "#33ddff",
          -- Yank and litagure color ->, =, <=
          sky = "#33ddff",
          sapphire = "#33ddff",
          -- Folder color in neo-tree the background for normal mode the border for the buffers.
          blue = "#cc0000",
          lavender = "#ffff00",
          -- File names, gitsigns, commands, file name on the status bar, indent_line context, indentation sign.
          text = "#33ddff",
          -- Git branch and language in status line.
          subtext1 = "#33ddff",
          subtext0 = "#a6adc8",
          -- Comments and periods/commas and parens, brackets and curly brackets.
          overlay2 = "#3379d4",
          overlay1 = "#7f849c",
          -- Unselected Tab name and folder lines.
          overlay0 = "#cc0000",
          surface2 = "#585b70",
          -- Color of the background of currently highlighted text.
          surface1 = "#5c5c5c",
          -- Color of the current line highlight
          surface0 = "#444444",
          -- Color of the text editor background
          base = "#000000",
          -- Color of the neo-tree background
          mantle = "#000000",
          crust = "#ffffff",
        },
      },
      highlight_overrides = {
        mocha = function()
          return {
            Comment                    = { fg = '#69838C' },
            LineNr                     = { fg = '#880000', bg = '#0d0d0d' },
            CursorLineNr               = { fg = '#33ddff', bg = '#0a0a0a' },
            SignColumn                 = { bg = '#0d0d0d' },
            FoldColumn                 = { bg = '#0d0d0d' },
            CursorLineSign             = { bg = '#0a0a0a' },
            CursorLineFold             = { bg = '#0a0a0a' },
            CursorLine                 = { bg = '#0f0f0f' },

            --diagnostics
            DiagnosticError            = { fg = '#ff2020' },
            DiagnosticWarn             = { fg = '#ff8020' },
            DiagnosticInfo             = { fg = '#80f0f0' },
            DiagnosticHint             = { fg = '#50f080' },

            DiagnosticSignError        = { fg = '#ff2020', bg = '#0d0d0d' },
            DiagnosticSignWarn         = { fg = '#ff8020', bg = '#0d0d0d' },
            DiagnosticSignInfo         = { fg = '#80f0f0', bg = '#0d0d0d' },
            DiagnosticSignHint         = { fg = '#50f080', bg = '#0d0d0d' },

            DiagnosticUnderlineError   = { fg = '#ff2020' },
            DiagnosticUnderlineWarn    = { fg = '#ff8020' },
            DiagnosticUnderlineInfo    = { fg = '#80f0f0' },
            DiagnosticUnderlineHint    = { fg = '#50f080' },

            DiagnosticVirtualTextError = { fg = '#ff2020', bg = '#0d0d0d' },
            DiagnosticVirtualTextWarn  = { fg = '#ffff20', bg = '#0d0d0d' },
            DiagnosticVirtualTextInfo  = { fg = '#80f0f0', bg = '#0d0d0d' },
            DiagnosticVirtualTextHint  = { fg = '#50f080', bg = '#0d0d0d' },

            --git status
            GitSignsAdd                = { fg = '#20cc20' },
            GitSignsChange             = { fg = '#ff8020' },
            GitSignsDelete             = { fg = '#cc2020' },
            GitSignsAddNr              = { fg = '#20cc20' },
            GitSignsAddLn              = { fg = '#20cc20' },
            GitSignsChangeNr           = { fg = '#ff8020' },
            GitSignsChangeLn           = { fg = '#ff8020' },
            GitSignsDeleteNr           = { fg = '#cc2020' },
            GitSignsDeleteLn           = { fg = '#cc2020' },

          }
        end,
      },
    }
    -- Sets Catppuccin as the color scheme for Neovim
    vim.cmd 'colorscheme catppuccin'

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


    dashboard.section.header.val = {
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⣠⣤⣶⣶⣿⣿⣿⣿⣿⣶⣶⣶⣤⣄⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⣠⣴⣿⣿⠿⠟⠛⣉⣭⣭⣭⣭⣉⠛⠻⠿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⣠⣾⣿⠿⠋⠁⠀⣰⣾⣿⣿⣿⣿⣿⣿⣷⡄⠀⠈⠙⠿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⢀⣼⣿⡿⠁ ⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠈⢿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⠏⠀ ⣀⣀ ⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⡟ ⢀⣀⣀⡀⠀⠹⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡏⣰⣾⣿⣿⣿⣿⣷⣮⠻⣿⣿⣿⣿⣿⣿⠟⣵⣾⣿⣿⣿⣿⣷⣆⢹⣿⣷ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⢙⣿⣿⡋⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡏⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢹⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠘⢿⣿⣿⣿⣿⣿⣿⣿⣇⠀⢸⣿⣿⡇⠀⣼⣿⣿⣿⣿⣿⣿⣿⡿⠃⣽⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⡀⠀⠙⠛⠿⠿⠛⠛⢿⣿⣷⣜⣿⣿⡇⣾⣿⡿⠛⠻⠿⠿⠛⠋⠀⢠⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣷⠀ ⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀ ⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇ ⠀⠀⠀⠀⠀⠀ ⢀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣦⡀ ⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀ ⣴⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⣄ ⠀⠀⠀⢸⣿⣿⡇ ⠀⠀ ⣠⣶⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⣿⣶⣧⣶⣿⣿⣶⣶⣶⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠿⠻⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀ ⠀⣀⣀⣀⣀ ⠀ ⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀ ⠀ ⣀⣀⣀⠀ ⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠀⠀ ⠀ ⣀⣀⣀⣀⠀⠀ ⣀⣀⣀ ⠀ ⢀⣀⣀⣀⣀⣀⣀⣀⣀ ⠀ ⠀⠀⠀⠀]],
      [[ ⠀⠀ ⢀⣶⣿⣿⣿⣿⣿⣷⣄ ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢠⣴⣿⣿⣿⣿⣿⣷⣤ ⠀ ⠀⠀⠀⣿⣿⣿⣿⣶⡄ ⢀⣴⣿⣿⣿⣿⣿⣷⣄⠀⣿⣿⣿⣿ ⣤⣾⣿⣿⡿⣻⣿⣿⣿⣿⣿⣿⣦⡄ ⠀⠀⠀]],
      [[ ⠀⠀⢠⣿⣿⡟⠉⠁⠈⠛⣿⣿⣷⢸⣿⣿⠉⠉⠉⠉⠉⢉⣿⣿⣇⣿⣿⡟⠋⠁⠀⠙⢿⣿⣿ ⠲⣶⣶⣶⣿⣍⡉⠉⠉⠁⢰⣿⣿⡟⠉⠁⠈⠙⣿⣿⣷⢽⣿⣿⣿⣿⡿⠛⠁⣼⣿⣿⠋⠉⠀⠉⠻⣿⣿⡆⠀⠀⠀]],
      [[ ⠀⠀⢸⣿⣿⡀⠀⠀⠀⠀⢸⣿⣿⢸⣿⣿⣷⣤⡀ ⠀⠀⠀⠀⢸⣿⣿⡅ ⠀⠀⠀⢸⣿⣿ ⣠⣀⡉⠻⢿⣿⣿⣶⣄⡀⢸⣿⣿  ⠀⠀⠀⢸⣿⣿⢽⣿⣿⣿⣥⡀⠀ ⣿⣿⣧⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀]],
      [[ ⠀⠀⠘⢿⣿⣷⣤⣤⣤⡀⢸⣿⣿⢸⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠈⢿⣿⣿⣦⣤⣴⣄⢸⣿⣿⢺⣿⣿⣧⣤⣤⣭⣿⣿⣿⣿⡞⢿⣿⣷⣦⣤⣤⣀⢸⣿⣿⢽⣿⣿⢿⣿⣿⣶⣤⡹⣿⣿⣶⣤⣤⣤⡀⣿⣿⡇⠀⠀⠀]],
      [[ ⠀⠀⠀ ⠙⠿⢿⣿⣿⣿⢸⣿⣿⠀⠀⠀⠀ ⠙⠿⣿⣿⣷⣦⡀⠀⠙⠻⠿⣿⣿⣿⢸⣿⣿ ⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠙⠿⢿⣿⣿⣿⢸⣿⣿⠀⠀⠀⠀⠈⠛⢿⣿⣿⣾⣿⠿⣿⣿⣿⡇⣿⣿⡇⠀⠀⠀]],
    }
    -- Set the color to a specific hex code (e.g., green)
    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#ff0000' })

    -- Reapply after colorscheme changes
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#ff0000' })
      end,
    })

    dashboard.section.header.opts.hl = 'AlphaHeader'
    require('alpha').setup(dashboard.config)

    --lualine theme
    require('lualine').setup {
      options = {
        theme = 'catppuccin-nvim',
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '', right = '' } } }, -- leave colors alone
        lualine_b = { { 'filename', color = { fg = '#33D4C4', bg = '#303030' }, separator = { left = '', right = '' } } }, -- grey background with cyan text
        lualine_c = {
          { 'branch', color = { fg = '#D90202', bg = '#808080' }, separator = { right = '' } },
          {
            'diff',
            colored = true,
            diff_color = {
              added = { fg = '#14DE2C', bg = '#bbbbbb' },
              modified = { fg = '#932CB0', bg = '#bbbbbb' },
              removed = { fg = '#D90202', bg = '#bbbbbb' },
            },
            separator = { right = '' },
          },
        }, -- white background with red text}
        lualine_x = { { 'encoding', color = { fg = 'D90202', bg = '#808080' }, separator = { left = '' } } }, -- white background with red text
        lualine_y = { { 'lsp_status', color = { fg = '#33D4C4', bg = '#303030' }, separator = { left = '' } } }, -- grey background with cyan text
        lualine_z = { { 'location', separator = { left = '', right = '' } } }, -- leave colors alone
      },
    }

    --barbar

    require "barbar".setup {
      animation = true,
      focus_on_close = 'previous',
      highlight_visible = false,
      highlight_alternate = false,
      highlight_inactive_file_icons = false,
      icons = {
        preset = 'slanted',
        separator_at_end = true,
      },
      sort = {
        ignore_case = true,
      },
      sort_by_name = true,
      non_name_title = 'empty file',
    }
  end,
}
