vim.env.JDTLS_JVM_ARGS = '-javaagent:' .. vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar'

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
    local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'
    local lombok_jar = jdtls_path .. '/lombok.jar'
    local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
    local workspace_dir = home .. '/.cache/jdtls-workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

    local cmd = {
      'java',
      '-javaagent:' .. lombok_jar,
      '-Dlombok.debug=true',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens',
      'java.base/java.util=ALL-UNNAMED',
      '--add-opens',
      'java.base/java.lang=ALL-UNNAMED',
      '-jar',
      launcher_jar,
      '-configuration',
      jdtls_path .. '/config_linux',
      '-data',
      workspace_dir,
    }
    -- Start or attach jdtls when opening Java files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        require('jdtls').start_or_attach {
          cmd = cmd,
          root_dir = require('jdtls.setup').find_root { '.git', 'pom.xml', 'build.gradle' },
          settings = {
            java = {
              signatureHelp = { enabled = true },
              contentProvider = { preferred = 'fernflower' },
            },
          },
        }
      end,
    })
  end,
}
