return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', 'ga,', '<Cmd>BufferPrevious<CR>', opts)
    map('n', 'ga.', '<Cmd>BufferNext<CR>', opts)

    -- Re-order to previous/next
    map('n', 'ga<', '<Cmd>BufferMovePrevious<CR>', opts)
    map('n', 'ga>', '<Cmd>BufferMoveNext<CR>', opts)

    -- Goto buffer in position...
    map('n', 'ga1', '<Cmd>BufferGoto 1<CR>', opts)
    map('n', 'ga2', '<Cmd>BufferGoto 2<CR>', opts)
    map('n', 'ga3', '<Cmd>BufferGoto 3<CR>', opts)
    map('n', 'ga4', '<Cmd>BufferGoto 4<CR>', opts)
    map('n', 'ga5', '<Cmd>BufferGoto 5<CR>', opts)
    map('n', 'ga6', '<Cmd>BufferGoto 6<CR>', opts)
    map('n', 'ga7', '<Cmd>BufferGoto 7<CR>', opts)
    map('n', 'ga8', '<Cmd>BufferGoto 8<CR>', opts)
    map('n', 'ga9', '<Cmd>BufferGoto 9<CR>', opts)
    map('n', 'ga0', '<Cmd>BufferLast<CR>', opts)

    -- Pin/unpin buffer
    map('n', 'gaP', '<Cmd>BufferPin<CR>', opts)

    -- Goto pinned/unpinned buffer
    --                 :BufferGotoPinned
    --                 :BufferGotoUnpinned

    -- Close buffer
    map('n', 'gac', '<Cmd>BufferClose<CR>', opts)

    -- Wipeout buffer
    --                 :BufferWipeout

    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight

    -- Magic buffer-picking mode
    map('n', 'gap', '<Cmd>BufferPick<CR>', opts)
    map('n', 'gad', '<Cmd>BufferPickDelete<CR>', opts)

    -- Sort automatically by...
    map('n', 'gaob', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
    map('n', 'gaon', '<Cmd>BufferOrderByName<CR>', opts)
    map('n', 'gaod', '<Cmd>BufferOrderByDirectory<CR>', opts)
    map('n', 'gaol', '<Cmd>BufferOrderByLanguage<CR>', opts)
    map('n', 'gaow', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
  end,
  opts = {
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
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
