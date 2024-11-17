return {
  {
    "neovim/nvim-lspconfig",
    lazy=false,
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
      local capabilites = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      }
      require('lspconfig').lua_ls.setup({
        capabilites = capabilites,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      })
      require('lspconfig').vtsls.setup({
        capabilites=capabilites,
        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      })


      -- setup native lsp
      local function setup()
        local signs = {
          { name = "DiagnosticSignError", text = vimGlobal.config.icons.diagnostics.Error },
          { name = "DiagnosticSignWarn", text = vimGlobal.config.icons.diagnostics.Warn},
          { name = "DiagnosticSignHint", text = vimGlobal.config.icons.diagnostics.Hint },
          { name = "DiagnosticSignInfo", text = vimGlobal.config.icons.diagnostics.Info },
        }

        for _, sign in ipairs(signs) do
          vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end

        -- set the style of lsp info
        local config = {
          -- disable virtual text
          -- the message show after the current line.
          virtual_text = false,
          -- show signs
          signs = {
            active = signs,
          },
          update_in_insert = true,
          underline = true,
          severity_sort = true,
          float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
          },
        }

        -- register lsp config
        vim.diagnostic.config(config)

        -- set the popup window border
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = "rounded",
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
          border = "rounded",
        })
      end

      setup()
    end,
  },
}
