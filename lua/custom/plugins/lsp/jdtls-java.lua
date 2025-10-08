vim.env.JDTLS_JVM_ARGS = '-javaagent:' .. vim.fn.expand '$HOME/.local/share/nvim/mason/packages/lombok-nightly/lombok.jar'

return {
  'mfussenegger/nvim-jdtls',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'j-hui/fidget.nvim',
  },
  config = function()
    local home = os.getenv 'HOME'
    local jdtls = require 'jdtls'

    -- Configure workspace directory
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = home .. '/.cache/jdtls-workspace/' .. project_name

    -- Path to jdtls installation (adjust if needed)
    local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'

    -- Path to lombok
    local lombok_jar = home .. '/.local/share/nvim/mason/packages/lombok-nightly/lombok.jar'

    -- Main jdtls command
    local config = {
      cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-jar',
        jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration',
        jdtls_path .. '/config_linux',
        '-data',
        workspace_dir,
      },
      root_dir = require('jdtls.setup').find_root { '.git', 'pom.xml', 'build.gradle', 'settings.gradle' },
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = 'fernflower' },
        },
      },
      init_options = {
        bundles = {
          vim.fn.glob(lombok_jar),
        },
      },
    }

    -- Start or attach jdtls when opening Java files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        jdtls.start_or_attach(config)
      end,
    })
  end,
}
