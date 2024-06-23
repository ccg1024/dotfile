-- for telescope and the its extension
local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local fb_actions = require("telescope").extensions.file_browser.actions
local actions = require("telescope.actions")

-- for copy file path
local action_state = require("telescope.actions.state")
actions.copy_full_path = function()
	local symbol = action_state.get_selected_entry().value
	vim.fn.setreg("+", symbol)
end

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

require("telescope").setup({
	defaults = {
		wrap_results = true,
		initial_mode = "insert",
		prompt_prefix = "  ",
		selection_caret = " ",
		path_display = { "smart" },
		layout_strategy = "horizontal",
		layout_config = { height = 0.95, width = 0.65 },
		sorting_strategy = "ascending",
		winblend = 0,
		mappings = {
			["n"] = {
				["<c-d>"] = actions.delete_buffer,
				["q"] = actions.close,
				["l"] = actions.select_default,
				["/"] = function()
					vim.cmd("startinsert")
				end,
			},
			["i"] = {
				["<c-d>"] = actions.delete_buffer,
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
			initial_mode = "normal",
			path = "%:p:h",
			cwd = telescope_buffer_dir(),
			respect_gitignore = false,
			hidden = false,
			grouped = true,
			previewer = false,
			theme = "dropdown",
			preview_cutoff = true,
			hijack_netrw = true,
			mappings = {
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["H"] = fb_actions.toggle_hidden,
					["Y"] = actions.copy_full_path,
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
				},
			},
		},
	},
})

-- for extention
-- telescope.load_extension("fzf")
telescope.load_extension("file_browser")

-- illuminate
-- default configuration
require("illuminate").configure({
	-- providers: provider used to get references in the buffer, ordered by priority
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	-- delay: delay in milliseconds
	delay = 100,
	-- filetype_overrides: filetype specific overrides.
	-- The keys are strings to represent the filetype while the values are tables that
	-- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
	filetype_overrides = {},
	-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
	filetypes_denylist = {
		"dirbuf",
		"dirvish",
		"fugitive",
	},
	-- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
	-- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
	filetypes_allowlist = {},
	-- modes_denylist: modes to not illuminate, this overrides modes_allowlist
	-- See `:help mode()` for possible values
	modes_denylist = {},
	-- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
	-- See `:help mode()` for possible values
	modes_allowlist = {},
	-- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
	-- Only applies to the 'regex' provider
	-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
	providers_regex_syntax_denylist = {},
	-- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
	-- Only applies to the 'regex' provider
	-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
	providers_regex_syntax_allowlist = {},
	-- under_cursor: whether or not to illuminate under the cursor
	under_cursor = true,
	-- large_file_cutoff: number of lines at which to use large_file_config
	-- The `under_cursor` option is disabled when this cutoff is hit
	large_file_cutoff = nil,
	-- large_file_config: config to use for large files (based on large_file_cutoff).
	-- Supports the same keys passed to .configure
	-- If nil, vim-illuminate will be disabled for large files.
	large_file_overrides = nil,
	-- min_count_to_highlight: minimum number of matches required to perform highlighting
	min_count_to_highlight = 1,
	-- should_enable: a callback that overrides all other settings to
	-- enable/disable illumination. This will be called a lot so don't do
	-- anything expensive in it.
	should_enable = function(bufnr)
		return true
	end,
	-- case_insensitive_regex: sets regex case sensitivity
	case_insensitive_regex = false,
})
