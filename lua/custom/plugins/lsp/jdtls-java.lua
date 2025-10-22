vim.env.JDTLS_JVM_ARGS = '-javaagent:' .. vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar'
return {
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
    config = function()
      local jdtls = require 'jdtls'

      -- Mason paths
      local mason_path = vim.fn.stdpath 'data' .. '/mason/packages/jdtls'
      local lombok_path = mason_path .. '/lombok.jar'
      local workspace_dir = vim.fn.stdpath 'cache' .. '/jdtls/workspace'

      -- Find Eclipse launcher jar dynamically
      local launcher_jar = vim.fn.glob(mason_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

      local config = {
        cmd = {
          'java',
          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.level=ALL',
          '-Xmx1G',
          '--add-modules=ALL-SYSTEM',
          '--add-opens',
          'java.base/java.util=ALL-UNNAMED',
          '--add-opens',
          'java.base/java.lang=ALL-UNNAMED',
          '-javaagent:' .. lombok_path,
          '-Xbootclasspath/a:' .. lombok_path,
          '-jar',
          launcher_jar,
          '-configuration',
          mason_path .. '/config_mac', -- adapt for your OS
          '-data',
          workspace_dir,
        },
        root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'build.gradle', 'pom.xml' },
        init_options = {
          bundles = {},
        },
      }
      -- -- Start or attach jdtls when opening Java files
      -- vim.api.nvim_create_autocmd('FileType', {
      --   pattern = 'java',
      --   callback = function()
      --     jdtls.start_or_attach(config)
      --   end,
      -- })
    end,
  },
}
