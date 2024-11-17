return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		keys = {
			{ "<leader>cm", "<cmd>Mason<cr>", desc = "Open Mason" },
		},
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- ensure_installed = {
			-- 	"stylua",
			-- 	"selene",
			-- 	"luacheck",
			-- 	"shellcheck",
			-- 	"shfmt",
			-- 	"css-lsp",
			-- 	"json-lsp",
			-- },
			ensure_installed = { "lua_ls", "rust_analyzer", "cssls", "jsonls", "vtsls", "eslint" },
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
}
