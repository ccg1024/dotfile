return {
  {
    "williamboman/mason.nvim",
    lazy=false,
    keys = {
      {"<leader>cm", "<cmd>Mason<cr>", desc="Open Mason"}
    },
    opts = {}
  },
  {"williamboman/mason-lspconfig.nvim"}
}
