-- define a global variable
_G.ccgvim = {
	config = {},
	ui = {},
	lualine = {},
	root = setmetatable({}, {
		__call = function(m)
			return m.get()
		end,
	}),
}

function ccgvim.is_win()
	return vim.uv.os_uname().sysname:find("Windows") ~= nil
end

ccgvim.config.icons = {
	misc = {
		dots = "󰇘",
	},
	ft = {
		octo = "",
	},
	dap = {
		Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
		Breakpoint = " ",
		BreakpointCondition = " ",
		BreakpointRejected = { " ", "DiagnosticError" },
		LogPoint = ".>",
	},
	diagnostics = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	},
	git = {
		added = " ",
		modified = " ",
		removed = " ",
	},
	kinds = {
		Array = " ",
		Boolean = "󰨙 ",
		Class = " ",
		Codeium = "󰘦 ",
		Color = " ",
		Control = " ",
		Collapsed = " ",
		Constant = "󰏿 ",
		Constructor = " ",
		Copilot = " ",
		Enum = " ",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = " ",
		Folder = " ",
		Function = "󰊕 ",
		Interface = " ",
		Key = " ",
		Keyword = " ",
		Method = "󰊕 ",
		Module = " ",
		Namespace = "󰦮 ",
		Null = " ",
		Number = "󰎠 ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String = " ",
		Struct = "󰆼 ",
		TabNine = "󰏚 ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = "󰀫 ",
	},
}

function ccgvim.ui.fg(name)
	local color = ccgvim.ui.color(name)
	return color and { fg = color } or nil
end

function ccgvim.ui.color(name, bg)
	local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name, link = false })
		or vim.api.nvim_get_hl_by_name(name, true)
	local color = nil
	if hl then
		if bg then
			color = hl.bg or hl.background
		else
			color = hl.fg or hl.foreground
		end
	end
	return color and string.format("#%06x", color) or nil
end

function ccgvim.lualine.root_dir(opts)
	opts = vim.tbl_extend("force", {
		cwd = false,
		subdirectory = true,
		parent = true,
		other = true,
		icon = "󱉭 ",
		color = ccgvim.ui.fg("Special"),
	}, opts or {})

	local function get()
		local cwd = ccgvim.root.cwd()
		local root = ccgvim.root.get({ normalize = true })
		local name = vim.fs.basename(root)

		if root == cwd then
			-- root is cwd
			return opts.cwd and name
		elseif root:find(cwd, 1, true) == 1 then
			-- root is subdirectory of cwd
			return opts.subdirectory and name
		elseif cwd:find(root, 1, true) == 1 then
			-- root is parent directory of cwd
			return opts.parent and name
		else
			-- root and cwd are not related
			return opts.other and name
		end
	end

	return {
		function()
			return (opts.icon and opts.icon .. " ") .. get()
		end,
		cond = function()
			return type(get()) == "string"
		end,
		color = opts.color,
	}
end

function ccgvim.root.cwd()
	return ccgvim.root.realpath(vim.uv.cwd()) or ""
end

---@type table<number, string>
ccgvim.root.cache = {}

ccgvim.root.spec = { "lsp", { ".git", "lua" }, "cwd" }

ccgvim.root.detectors = {}

---@param opts? {normalize?:boolean, buf?:number}
---@return string
function ccgvim.root.get(opts)
	opts = opts or {}
	local buf = opts.buf or vim.api.nvim_get_current_buf()
	local ret = ccgvim.root.cache[buf]
	if not ret then
		local roots = ccgvim.root.detect({ all = false, buf = buf })
		ret = roots[1] and roots[1].paths[1] or vim.uv.cwd()
		ccgvim.root.cache[buf] = ret
	end
	if opts and opts.normalize then
		return ret
	end
	return ccgvim.is_win() and ret:gsub("/", "\\") or ret
end

function ccgvim.root.detect(opts)
	opts = opts or {}
	opts.spec = opts.spec or type(vim.g.root_spec) == "table" and vim.g.root_spec or ccgvim.root.spec
	opts.buf = (opts.buf == nil or opts.buf == 0) and vim.api.nvim_get_current_buf() or opts.buf

	local ret = {}
	for _, spec in ipairs(opts.spec) do
		local paths = ccgvim.root.resolve(spec)(opts.buf)
		paths = paths or {}
		paths = type(paths) == "table" and paths or { paths }
		local roots = {}
		for _, p in ipairs(paths) do
			local pp = ccgvim.root.realpath(p)
			if pp and not vim.tbl_contains(roots, pp) then
				roots[#roots + 1] = pp
			end
		end
		table.sort(roots, function(a, b)
			return #a > #b
		end)
		if #roots > 0 then
			ret[#ret + 1] = { spec = spec, paths = roots }
			if opts.all == false then
				break
			end
		end
	end
	return ret
end

function ccgvim.root.resolve(spec)
	if ccgvim.root.detectors[spec] then
		return ccgvim.root.detectors[spec]
	elseif type(spec) == "function" then
		return spec
	end
	return function(buf)
		return ccgvim.root.detectors.pattern(buf, spec)
	end
end

function ccgvim.root.detectors.pattern(buf, patterns)
	patterns = type(patterns) == "string" and { patterns } or patterns
	local path = ccgvim.root.bufpath(buf) or vim.uv.cwd()
	local pattern = vim.fs.find(function(name)
		for _, p in ipairs(patterns) do
			if name == p then
				return true
			end
			if p:sub(1, 1) == "*" and name:find(vim.pesc(p:sub(2)) .. "$") then
				return true
			end
		end
		return false
	end, { path = path, upward = true })[1]
	return pattern and { vim.fs.dirname(pattern) } or {}
end

function ccgvim.root.bufpath(buf)
	return ccgvim.root.realpath(vim.api.nvim_buf_get_name(assert(buf)))
end

function ccgvim.root.realpath(path)
	if path == "" or path == nil then
		return nil
	end
	path = vim.uv.fs_realpath(path) or path
	return path
	-- return LazyVim.norm(path)
end

function ccgvim.lualine.pretty_path(opts)
	opts = vim.tbl_extend("force", {
		relative = "cwd",
		modified_hl = "MatchParen",
		directory_hl = "",
		filename_hl = "Bold",
		modified_sign = "",
		readonly_icon = " 󰌾 ",
		length = 3,
	}, opts or {})

	return function(self)
		local path = vim.fn.expand("%:p") --[[@as string]]

		if path == "" then
			return ""
		end

		local root = ccgvim.root.get({ normalize = true })
		local cwd = ccgvim.root.cwd()

		if opts.relative == "cwd" and path:find(cwd, 1, true) == 1 then
			path = path:sub(#cwd + 2)
		else
			path = path:sub(#root + 2)
		end

		local sep = package.config:sub(1, 1)
		local parts = vim.split(path, "[\\/]")

		if opts.length == 0 then
			parts = parts
		elseif #parts > opts.length then
			parts = { parts[1], "…", table.concat({ unpack(parts, #parts - opts.length + 2, #parts) }, sep) }
		end

		if opts.modified_hl and vim.bo.modified then
			parts[#parts] = parts[#parts] .. opts.modified_sign
			parts[#parts] = ccgvim.lualine.format(self, parts[#parts], opts.modified_hl)
		else
			parts[#parts] = ccgvim.lualine.format(self, parts[#parts], opts.filename_hl)
		end

		local dir = ""
		if #parts > 1 then
			dir = table.concat({ unpack(parts, 1, #parts - 1) }, sep)
			dir = ccgvim.lualine.format(self, dir .. sep, opts.directory_hl)
		end

		local readonly = ""
		if vim.bo.readonly then
			readonly = ccgvim.lualine.format(self, opts.readonly_icon, opts.modified_hl)
		end
		return dir .. parts[#parts] .. readonly
	end
end

function ccgvim.lualine.format(component, text, hl_group)
	text = text:gsub("%%", "%%%%")
	if not hl_group or hl_group == "" then
		return text
	end
	---@type table<string, string>
	component.hl_cache = component.hl_cache or {}
	local lualine_hl_group = component.hl_cache[hl_group]
	if not lualine_hl_group then
		local utils = require("lualine.utils.utils")
		---@type string[]
		local gui = vim.tbl_filter(function(x)
			return x
		end, {
			utils.extract_highlight_colors(hl_group, "bold") and "bold",
			utils.extract_highlight_colors(hl_group, "italic") and "italic",
		})

		lualine_hl_group = component:create_hl({
			fg = utils.extract_highlight_colors(hl_group, "fg"),
			gui = #gui > 0 and table.concat(gui, ",") or nil,
		}, "LV_" .. hl_group) --[[@as string]]
		component.hl_cache[hl_group] = lualine_hl_group
	end
	return component:format_hl(lualine_hl_group) .. text .. component:get_default_hl()
end
