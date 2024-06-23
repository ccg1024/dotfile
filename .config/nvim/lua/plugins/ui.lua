return {
	{
		"nvim-lualine/lualine.nvim",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		opts = function()
			-- PERF: we don't need this lualine require madness 🤷
			local lualine_require = require("lualine_require")
			lualine_require.require = require

			local function diff_source()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end

			vim.o.laststatus = vim.g.lualine_laststatus

			local opts = {
				options = {
					theme = "solarized_dark",
					globalstatus = vim.o.laststatus == 3,
					disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{ "branch", icon = "" },
					},
					lualine_c = {
						ccgvim.lualine.root_dir(),
						{
							"diagnostics",
							symbols = {
								error = ccgvim.config.icons.diagnostics.Error,
								warn = ccgvim.config.icons.diagnostics.Warn,
								info = ccgvim.config.icons.diagnostics.Info,
								hint = ccgvim.config.icons.diagnostics.Hint,
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ ccgvim.lualine.pretty_path() },
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return require("nvim-navic").is_available()
							end,
						},
					},
					lualine_x = {
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = function()
								return ccgvim.ui.fg("Special")
							end,
						},
						{
							"diff",
							source = diff_source,
							symbols = {
								added = ccgvim.config.icons.git.added,
								modified = ccgvim.config.icons.git.modified,
								removed = ccgvim.config.icons.git.removed,
							},
							diff_color = {
								added = "DiffAdd",
								modified = "DiffChange",
								removed = "DiffDelete",
							},
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "lazy" },
			}
			-- do not add trouble symbols if aerial is enabled
			if vim.g.trouble_lualine then
				local trouble = require("trouble")
				local symbols = trouble.statusline
					and trouble.statusline({
						mode = "symbols",
						groups = {},
						title = false,
						filter = { range = true },
						format = "{kind_icon}{symbol.name:Normal}",
						hl_group = "lualine_c_normal",
					})
				table.insert(opts.sections.lualine_c, {
					symbols and symbols.get,
					cond = symbols and symbols.has,
				})
			end

			return opts
		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvimdev/dashboard-nvim",
		lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
		opts = function()
			local logo = [[
██████╗██████╗  █████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ██████╗ ███████╗ ██████╗  █████╗ ███╗   ███╗███████╗
██╔════╝██╔══██╗██╔══██╗╚══███╔╝╚██╗ ██╔╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝ ██╔══██╗████╗ ████║██╔════╝
██║     ██████╔╝███████║  ███╔╝  ╚████╔╝ ██║     ██║   ██║██║  ██║█████╗  ██║  ███╗███████║██╔████╔██║█████╗  
██║     ██╔══██╗██╔══██║ ███╔╝    ╚██╔╝  ██║     ██║   ██║██║  ██║██╔══╝  ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  
╚██████╗██║  ██║██║  ██║███████╗   ██║   ╚██████╗╚██████╔╝██████╔╝███████╗╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
                
    ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			return opts
		end,
	},
	{
		"b0o/incline.nvim",
		dependencies = { "craftzdog/solarized-osaka.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("solarized-osaka.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},
}
