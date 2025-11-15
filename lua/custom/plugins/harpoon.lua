return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
  config = function()
    require('harpoon'):setup()

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>pl', function()
      toggle_telescope(require('harpoon'):list())
    end, { desc = 'Open harpoon window' })
    vim.keymap.set('n', '<leader>pa', function()
      require('harpoon'):list():add()
    end, { desc = 'add buffer to harpoon' })

    vim.keymap.set('n', '<leader>pp', function()
      require('harpoon'):list():prev()
    end, { desc = 'new harpoon window' })
    vim.keymap.set('n', '<leader>pn', function()
      require('harpoon'):list():next()
    end, { desc = 'previous harpoon window' })
  end,
}
