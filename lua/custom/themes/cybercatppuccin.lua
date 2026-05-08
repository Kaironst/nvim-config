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
          rosewater = "#9600e6",
          flamingo = "#ffff00",
          pink = "#9600e6",
          mauve = "#ffff00",
          red = "#2266cc",
          maroon = "#9600e6",
          peach = "#cc0000",
          yellow = "#cc0000",
          green = "#00cc00",
          teal = "#33ddff",
          sky = "#cc0000",
          sapphire = "#33ddff",
          blue = "#cc0000",
          lavender = "#9600e6",
          text = "#33ddff",
          subtext1 = "#33ddff",
          subtext0 = "#a6adc8",
          overlay2 = "#3379d4",
          overlay1 = "#7f849c",
          overlay0 = "#cc0000",
          surface2 = "#585b70",
          surface1 = "#5c5c5c",
          surface0 = "#444444",
          base = "#000000",
          mantle = "#000000",
          crust = "#ffffff",
        },
      },
      highlight_overrides = {
        mocha = function()
          return {
            Comment = { fg = '#69838C' },
            LineNr = { fg = '#69838C' },
            CursorLineNr = { fg = '#33D4C4' },
          }
        end,
      },
    }
    -- Sets Catppuccin as the color scheme for Neovim
    vim.cmd 'colorscheme catppuccin'
  end,
}
