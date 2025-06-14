return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
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
				"sf",
				function()
					local telescope = require("telescope")
					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions
			local opts = {
				defaults = {
					wrap_results = true,
					layout_strategy = "horizontal",
					layout_config = { prompt_position = "top" },
					sorting_strategy = "ascending",
					winblend = 0,
					mappings = {
						n = {
							["<leader><cr>"] = actions.select_tab, -- onpen file on new tab
						},
					},
				},
				pickers = {
					diagnostics = {
						theme = "ivy",
						initial_mode = "normal",
						layout_config = {
							preview_cutoff = 9999,
						},
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true,
						mappings = {
							["n"] = {
								["N"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
								["/"] = function()
									vim.cmd("startinsert")
								end,
								["<C-u>"] = function(prompt_bufnr)
									for i = 1, 10 do
										actions.move_selection_previous(prompt_bufnr)
									end
								end,
								["<C-d>"] = function(prompt_bufnr)
									for i = 1, 10 do
										actions.move_selection_next(prompt_bufnr)
									end
								end,
								["<PageUp>"] = actions.preview_scrolling_up,
								["<PageDown>"] = actions.preview_scrolling_down,
							},
						},
					},
				},
			}
			telescope.setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("file_browser")
		end,
	},
}
