return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  opts = {},
  config = function()
    vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = '#420000' })

    -- Reapply after colorscheme changes
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = '#420000' })
      end,
    })
  end,
}
