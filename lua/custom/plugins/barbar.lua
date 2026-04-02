return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<leader>a,', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<leader>a.', '<Cmd>BufferNext<CR>', opts)

    -- Re-order to previous/next
    map('n', '<leader>a<', '<Cmd>BufferMovePrevious<CR>', opts)
    map('n', '<leader>a>', '<Cmd>BufferMoveNext<CR>', opts)

    -- Goto buffer in position...
    map('n', '<leader>a1', '<Cmd>BufferGoto 1<CR>', opts)
    map('n', '<leader>a2', '<Cmd>BufferGoto 2<CR>', opts)
    map('n', '<leader>a3', '<Cmd>BufferGoto 3<CR>', opts)
    map('n', '<leader>a4', '<Cmd>BufferGoto 4<CR>', opts)
    map('n', '<leader>a5', '<Cmd>BufferGoto 5<CR>', opts)
    map('n', '<leader>a6', '<Cmd>BufferGoto 6<CR>', opts)
    map('n', '<leader>a7', '<Cmd>BufferGoto 7<CR>', opts)
    map('n', '<leader>a8', '<Cmd>BufferGoto 8<CR>', opts)
    map('n', '<leader>a9', '<Cmd>BufferGoto 9<CR>', opts)
    map('n', '<leader>a0', '<Cmd>BufferLast<CR>', opts)

    -- Pin/unpin buffer
    map('n', '<leader>aP', '<Cmd>BufferPin<CR>', opts)

    -- Goto pinned/unpinned buffer
    --                 :BufferGotoPinned
    --                 :BufferGotoUnpinned

    -- Close buffer
    map('n', '<leader>ac', '<Cmd>BufferClose<CR>', opts)

    -- Wipeout buffer
    --                 :BufferWipeout

    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight

    -- Magic buffer-picking mode
    map('n', '<leader>ap', '<Cmd>BufferPick<CR>', opts)
    map('n', '<leader>ad', '<Cmd>BufferPickDelete<CR>', opts)

    -- Sort automatically by...
    map('n', '<leader>aob', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
    map('n', '<leader>aon', '<Cmd>BufferOrderByName<CR>', opts)
    map('n', '<leader>aod', '<Cmd>BufferOrderByDirectory<CR>', opts)
    map('n', '<leader>aol', '<Cmd>BufferOrderByLanguage<CR>', opts)
    map('n', '<leader>aow', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
