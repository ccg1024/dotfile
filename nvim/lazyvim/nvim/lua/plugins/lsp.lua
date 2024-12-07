return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "css-lsp",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
          },
        },
      },
    },
  },
}
