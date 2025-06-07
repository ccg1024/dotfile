return {
  {
    "mason-org/mason.nvim",
    opts = {},
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  { "mason-org/mason-lspconfig.nvim", config = function() end },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      },
      servers = {
        lua_ls = {
          on_init = function(client, _)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if
                  path ~= vim.fn.stdpath("config")
                  and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
              then
                return
              end
            end
            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
              runtime = {
                version = "LuaJIT",
                path = {
                  "lua/?.lua",
                  "lua/?/init.lua",
                },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            })
          end,
        },
        vtsls = {
          settings = {
            complete_function_calls = false,
            typescript = {
              suggest = {
                completeFunctionCalls = false,
              },
              preferences = {
                jsxAttributeCompletionStyle = "none",
              },
            },
            javascript = {
              suggest = {
                completeFunctionCalls = false,
              },
              preferences = {
                jsxAttributeCompletionStyle = "none",
              },
            },
            vtsls = { autoUseWorkspaceTsdk = true },
          },
        },
        cssls = {},
        stylelint_lsp = {
          settings = {
            stylelintplus = {
              -- see available options in stylelint-lsp documentation
            },
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      -- diagnostics
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    end,
  },
}
