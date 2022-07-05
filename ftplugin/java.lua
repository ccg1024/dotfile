-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

-- local workspace_dir = '/path/to/workspace-root/' .. project_name

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    -- /home/william/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar
    --/home/william/.local/share/nvim/lsp/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar
    '-jar', '/home/william/.local/share/nvim/lsp/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    -- /home/william/.local/share/nvim/lsp_servers/jdtls/config_linux
    --/home/william/.local/share/nvim/lsp/jdt-language-server/config_linux
    '-configuration', '/home/william/.local/share/nvim/lsp/jdt-language-server/config_linux',
    '-data', '/home/william/.local/share/nvim/lsp/workspace/folder',
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  settings = {
    java = { }
  },
  init_options = {
    bundles = {}
  },
}
require('jdtls').start_or_attach(config)
