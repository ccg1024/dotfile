return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>fP", -- find file in nvim plugin root
				function()
					require("telescope.builtin").find_files({
						cwd = require("lazy.core.config").options.root,
					})
				end,
				desc = "",
			},
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({ no_ignore = false, hidden = true })
				end,
			},
			{
				";r",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep()
				end,
			},
			{
				"\\\\",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
			},
			{
				";t",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags()
				end,
			},
			{
				";;",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume()
				end,
			},
			{
				";E",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
			},
			{
				";s",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter()
				end,
			},
			{
				"sf",
				function()
					local telescope = require("telescope")
					telescope.extensions.file_browser.file_browser()
				end,
			},
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
	{
		"RRethy/vim-illuminate",
	},
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = function()
			vim.g.navic_silence = true
		end,
		opts = function()
			return {
				separator = " ",
				highlight = true,
				depth_limit = 5,
				icons = ccgvim.config.icons.kinds,
				lazy_update_context = false,
			}
		end,
	},
}
