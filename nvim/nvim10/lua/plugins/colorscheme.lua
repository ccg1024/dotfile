return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			-- vim.cmd([[ colorscheme gruvbox ]])
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("solarized-osaka").setup(opts)
			vim.cmd([[colorscheme solarized-osaka]])
		end,
		opts = {
			styles = {
				keywords = { italic = false },
				functions = { bold = true },
			},
		},
	},
}
