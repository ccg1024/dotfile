require("nvim-lsp-installer").setup{}

local navic = require("nvim-navic")
local illuminate = require("illuminate")

local lsp_flags = {
  debounce_text_changes = 100,
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function (client, bufnr)
  navic.attach(client, bufnr)
  illuminate.on_attach(client)
end

-- group
local lsp = vim.api.nvim_create_augroup("LSP", { clear = true })

-- lua
-- NOTE: you could also use ftplugin/lua.lua to setup the LSP server
vim.api.nvim_create_autocmd("FileType", {
  group = lsp,
  pattern = "lua",
  callback = function ()
    local path = vim.fs.find({ ".luarc.json", ".luacheckrc", "stylua.toml", ".git" })
    vim.lsp.start({
      name = "lua-language-server",
      cmd = { "/Users/ccg/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server" },
      root_dir = vim.fs.dirname(path[1]),
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      settings = {
        Lua = {
          completion = { enable = true, showWord = "Disable" },
          runtime = { version = "LuaJIT" },
          workspace = { library = { os.getenv("VIMRUNTIME") } },
          telemetry = { enable = false },
          diagnostics = {
            globals = {"vim", "packer_bootstrap"},
          },
        },
      },
    })
  end,
})

-- python
vim.api.nvim_create_autocmd("FileType", {
  group = lsp,
  pattern = "python",
  callback = function ()
    local path = vim.fs.find({ 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json' })
    vim.lsp.start({
      name = "pyright-langserver",
      cmd = { "/Users/ccg/.local/share/nvim/lsp_servers/pyright/node_modules/.bin/pyright-langserver", "--stdio" },
      root_dir = vim.fs.dirname(path[1]),
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
            typeCheckingMode = "off",
          },
        },
      },
    })
  end,
})

-- texlib
vim.api.nvim_create_autocmd("FileType", {
  group = lsp,
  pattern = { "tex", "plaintex", "bib" },
  callback = function ()
    vim.lsp.start({
      name = "texlab",
      cmd = { "/Users/ccg/.local/share/nvim/lsp_servers/texlab/texlab" },
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      settings = {
        texlab = {
          auxDirectory = ".",
          bibtexFormatter = "texlab",
          build = {
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            executable = "latexmk",
            forwardSearchAfter = false,
            onSave = false
          },
          chktex = {
            onEdit = false,
            onOpenAndSave = false
          },
          diagnosticsDelay = 300,
          formatterLineLength = 80,
          forwardSearch = {
            args = {}
          },
          latexFormatter = "latexindent",
          latexindent = {
            modifyLineBreaks = false
          }
        }
      },
    })
  end,
})

-- c/c++
vim.api.nvim_create_autocmd("FileType", {
  group = lsp,
  pattern = { "c", "cpp", "objc", "objcpp", "cuda" },
  callback = function ()
    local path = vim.fs.find({ '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git' })
    vim.lsp.start({
      name = "clangd",
      cmd = { "/Users/ccg/.local/share/nvim/lsp_servers/clangd/clangd/bin/clangd" },
      root_dir = vim.fs.dirname(path[1]),
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = lsp,
  pattern = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  callback = function ()
    local path = vim.fs.find({ "package.json", "tsconfig.json", "jsconfig.json", ".git" })
    vim.lsp.start({
      name = "typescript-language-server",
      cmd = { "/Users/ccg/.local/share/nvim/lsp_servers/tsserver/node_modules/.bin/typescript-language-server", "--stdio" },
      root_dir = vim.fs.dirname(path[1]),
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp,
    callback = function(args)
        local bufopts = { buffer = args.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    end,
})
vim.api.nvim_create_autocmd("LspDetach", {
    group = lsp,
    callback = function(args)
        vim.keymap.delete("n", "gD", { buffer = args.buf })
        vim.keymap.delete("n", "gd", { buffer = args.buf })
        vim.keymap.delete("n", "K", { buffer = args.buf })
        vim.keymap.delete("n", "<space>D", { buffer = args.buf })
        vim.keymap.delete("n", "<space>rn", { buffer = args.buf })
        vim.keymap.delete("n", "gr", { buffer = args.buf })
    end,
})

-- change info style of lsp
require("lsp.handlers").setup()
-- start cmp
require("lsp.cmp")

