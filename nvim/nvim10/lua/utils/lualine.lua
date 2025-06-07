local M = {}

-- 获取项目根目录（Git 仓库或包含特定文件的目录）
function M.get_root()
	-- 获取当前文件路径
	local file_path = vim.api.nvim_buf_get_name(0)
	if file_path == "" then
		return nil
	end

	-- 尝试查找 .git 目录作为根目录
	local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
	if git_root and vim.fn.isdirectory(git_root) == 1 then
		return git_root
	end

	-- 备选方案：查找包含特定文件的目录
	local markers = {
		".git",
		".svn",
		".hg", -- 版本控制目录
		"package.json",
		"Cargo.toml",
		"pyproject.toml", -- 项目文件
		"Makefile",
		"build.gradle", -- 构建文件
	}

	local current_dir = vim.fn.fnamemodify(file_path, ":h")
	while current_dir ~= "/" and current_dir ~= "" do
		for _, marker in ipairs(markers) do
			local path = current_dir .. "/" .. marker
			if vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1 then
				return current_dir
			end
		end
		current_dir = vim.fn.fnamemodify(current_dir, ":h")
	end

	-- 最后尝试使用当前工作目录
	local cwd = vim.fn.getcwd()
	if cwd ~= "" then
		return cwd
	end

	return nil
end

-- 格式化根目录显示
function M.root_dir()
	-- 排除特殊缓冲区类型
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "TelescopePrompt", "alpha", "help", "terminal" }, filetype) then
		return ""
	end

	local root = M.get_root()
	if not root then
		return ""
	end

	-- 提取目录名
	local dirname = vim.fn.fnamemodify(root, ":t")

	-- 根据项目类型选择图标
	local icon = "" -- 默认 Git 图标

	-- 检测项目类型
	local project_files = {
		["package.json"] = " ", -- Node.js
		["Cargo.toml"] = " ", -- Rust
		["pyproject.toml"] = " ", -- Python
		["build.gradle"] = " ", -- Java
		["Makefile"] = " ", -- Make
	}

	for file, ico in pairs(project_files) do
		if vim.fn.filereadable(root .. "/" .. file) == 1 then
			icon = ico
			break
		end
	end

	return icon .. " " .. dirname
end

return M
