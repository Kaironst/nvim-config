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
    local jdtls = require 'jdtls'
    local home = vim.fn.expand '$HOME'

    -- Caminhos principais
    local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'
    local lombok_jar = home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar'

    -- Workspace único por projeto
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = home .. '/.cache/jdtls-workspace/' .. project_name

    -- Configuração base
    local config = {
      cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '-Xmx2G',
        '-javaagent:' .. lombok_jar,
        '-jar',
        vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        jdtls_path .. '/config_linux',
        '-data',
        workspace_dir,
      },

      root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },

      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = 'fernflower' },
          configuration = {
            runtimes = {
              {
                name = 'JavaSE-17',
                path = '/usr/lib/jvm/java-17-openjdk',
              },
            },
          },
        },
      },

      init_options = {
        bundles = {}, -- deixa vazio; Lombok é javaagent, não bundle
      },
    }

    -- Inicia o JDTLS automaticamente em arquivos Java
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        jdtls.start_or_attach(config)
      end,
    })
  end,
}
