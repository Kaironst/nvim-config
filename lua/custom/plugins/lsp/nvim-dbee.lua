local function getSelection()
  vim.cmd 'noau normal! "vy'
  return vim.fn.getreg 'v'
end

return {
  'kndndrj/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup(--[[optional config]])

    vim.keymap.set('n', '<Leader>Db', '<cmd>lua require("dbee").toggle()<CR>', {
      desc = 'Toggles Database interface on/off',
    })

    vim.keymap.set('v', '<Leader>Db', function()
      require('dbee').execute(getSelection())
    end, {
      desc = 'queries current selection on active connection',
    })
  end,
}
