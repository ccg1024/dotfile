local lspconfig = require("lspconfig")
-- local navic = require("nvim-navic")

local function on_attach(client, bufnr) -- set up buffer keymaps, etc.
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- set up for illuminate
  -- require 'illuminate'.on_attach(client)
  require("illuminate").on_attach(client)

  -- nvim-nvic
  -- if client.server_capabilities.documentFormattingProvider then
  -- navic.attach(client, bufnr)
  -- end
end

local lsp_flags = {
  debounce_text_changes = 100,
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- start server
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { "vim", "packer_bootstrap" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- close the work environemt question
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off",
      }
    }
  },
}

-- c/c++
lspconfig.clangd.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

-- javascript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- texlab
lspconfig.texlab.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    texlab = {
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
      rootDirectory = ".",
    },
  },
  root_dir = lspconfig.util.root_pattern("."),
}

-- astro
lspconfig.astro.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- change info style of lsp
require("lsp.handlers").setup()
-- start cmp
require("lsp.cmp")
