-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

-- local workspace_dir = '/path/to/workspace-root/' .. project_name

local navic = require("nvim-navic")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local function on_attach(client, bufnr) -- set up buffer keymaps, etc.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  require("illuminate").on_attach(client)
  navic.attach(client, bufnr)
end

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
    '-jar', '/Users/ccg/.local/share/nvim/lsp/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/Users/ccg/.local/share/nvim/lsp/jdt-language-server/config_mac',
    '-data', '/Users/ccg/.local/share/nvim/lsp/workspace/folder',
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  settings = {
    java = { }
  },
  init_options = {
    bundles = {}
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
require('jdtls').start_or_attach(config)
