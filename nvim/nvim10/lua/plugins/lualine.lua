local get_lsp_workfolder = function()
	local clients = vim.lsp.get_clients()
	if clients then
		for i in pairs(clients) do
			local client = clients[i]
			if client.workspace_folders then
				return client.workspace_folders[1].name
			end
		end
	end

	return ""
end

local format_file_path = function(path)
	if not path then
		return path
	end

	local parts = {}
	for part in string.gmatch(path, "([^/]+)") do
		table.insert(parts, part)
	end

	if #parts <= 5 then
		return path
	end

	local formated = {}
	table.insert(formated, parts[1])
	table.insert(formated, parts[2])
	table.insert(formated, "..")
	table.insert(formated, parts[#parts - 1])
	table.insert(formated, parts[#parts])

	return table.concat(formated, "/")
end

local get_file_path = function()
	local file_path = vim.fn.expand("%:p")
	if file_path == "" then
		return ""
	end

	local workfolder = ""
	local status, lsp_folder = pcall(get_lsp_workfolder)

	if status then
		workfolder = lsp_folder
	end

	if not workfolder then
		workfolder = vim.fn.expand("%:p:h")
	end

	file_path = vim.fn.fnamemodify(file_path, ":p")
	workfolder = vim.fn.fnamemodify(workfolder, ":p")

	local relative_path = file_path:sub(#workfolder + 1)

	relative_path = relative_path:gsub("^[/\\]+", "")

	return relative_path ~= "" and format_file_path(relative_path) or "[root]"
end

return {
	"nvim-lualine/lualine.nvim",
	opts = function()
		local opts = {
			options = {
				theme = "auto",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						color = {
							gui = "bold",
						},
					},
				},
				lualine_b = { "branch" },
				lualine_c = {
					get_file_path,
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				},
				lualine_x = {
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_z = {
					{
						"location",
						color = {
							gui = "bold",
						},
					},
				},
			},
		}
		return opts
	end,
}
