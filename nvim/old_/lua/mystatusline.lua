--  
-- reference site
-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

-- model
local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function MyUpdateColor()
  local currentMode = vim.api.nvim_get_mode().mode
  local modeColor = "%#MyStatusLineFlag#"
  if currentMode == "i" or currentMode == "ic" then
    modeColor = "%#MyStatusLineFlagI#"
  elseif currentMode == "v" or currentMode == "V" or currentMode == "" or currentMode == "Rv" then
    modeColor = "%#MyStatusLineFlagV#"
  end
  return modeColor
end

local function MyIconColor()
  local currentMode = vim.api.nvim_get_mode().mode
  local IconColor = "%#MyFlagIcon#"
  if currentMode == "i" or currentMode == "ic" then
    IconColor = "%#MyFlagIconI#"
  elseif currentMode == "v" or currentMode == "V" or currentMode == "" or currentMode == "Rv" then
    IconColor = "%#MyFlagIconV#"
  end
  return IconColor
end

local function Mymode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function LspHints()
  local sl = ''
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    sl = sl .. " :"
    sl = sl .. #vim.diagnostic.get(0, { severity=vim.diagnostic.severity.HINT })
  end
  return sl
end

local function LspWarns()
  local sl = ''
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    sl = sl .. " :"
    sl = sl .. #vim.diagnostic.get(0, { severity=vim.diagnostic.severity.WARN })
  end
  return sl
end

local function LspErrors()
  local sl = ''
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    sl = sl .. " :"
    sl = sl .. #vim.diagnostic.get(0, { severity=vim.diagnostic.severity.ERROR })
  end
  return sl
end

local function MyLspInfo()
  local sl = ''
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    local lsp_hints = vim.diagnostic.get(0, { severity=vim.diagnostic.severity.HINT })
    local lsp_warns = vim.diagnostic.get(0, { severity=vim.diagnostic.severity.WARN })
    local lsp_error = vim.diagnostic.get(0, { severity=vim.diagnostic.severity.ERROR })
    sl = sl .. "%#MyLspError#" .. "  " .. #lsp_error .. "%#MyLspHint#" .. "  " .. (#lsp_warns + #lsp_hints)
  end
  return sl
end

local function MyFileType()
  return string.format(" %s", vim.bo.filetype)
end

local function MyLineInfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %4l:%-3v "
end

local function MyEncode()
  local fileEncode = vim.bo.fileencoding
  if fileEncode == "" or fileEncode == nil then
    fileEncode = vim.go.encoding
  end
  return string.format(" [%s] " , string.upper(fileEncode))
end

local function MyReadonly()
  -- :set ro into readonly model
  -- :set noro exit readonly model
  local readonly = vim.bo.readonly
  if readonly == true then
    return string.format("%s", "")
  else
    return ""
  end
end

local function GetFileIcon()
  local filetype = vim.bo.filetype
  local icon, color = require("nvim-web-devicons").get_icon_color_by_filetype(filetype)
  if icon == nil or color == nil then
    return ""
  end
  vim.cmd('highlight MyFileTypeColor guibg=#24273a guifg=' .. color)
  local returnColor = "%#MyFileTypeColor#"
  return returnColor .. icon .. " " .. filetype
end

Statusline = {}

vim.cmd('highlight MODECOLOR guifg=#e6e9ef guibg=#24273a')

-- for new LSP error
vim.cmd('highlight MyLspError guifg=#d20f39 guibg=#24273a')
vim.cmd('highlight MyLspWarn guifg=#df8e1d guibg=#24273a')
vim.cmd('highlight MyLspHint guifg=#179299 guibg=#24273a')

-- for front part
vim.cmd('highlight MyStatusLineFlag guibg=#8839ef guifg=#e6e9ef')
vim.cmd('highlight MyStatusLineFlagI guibg=#d20f39 guifg=#e6e9ef')
vim.cmd('highlight MyStatusLineFlagV guibg=#fe640b guifg=#e6e9ef')

-- for icon, not use for this version 
vim.cmd([[exec 'highlight MyFlagIcon gui=bold guifg=#8839ef guibg=' . synIDattr(synIDtrans(hlID('MODECOLOR')), 'bg', 'gui')]])
vim.cmd([[exec 'highlight MyFlagIconI gui=bold guifg=#d20f39 guibg=' . synIDattr(synIDtrans(hlID('MODECOLOR')), 'bg', 'gui')]])
vim.cmd([[exec 'highlight MyFlagIconV  gui=bold guifg=#fe640b guibg=' . synIDattr(synIDtrans(hlID('MODECOLOR')), 'bg', 'gui')]])

-- for git part
vim.cmd('highlight GitPart guifg=#000000 guibg=#cad3f5')
vim.cmd('highlight MyGitIcon guifg=#fe640b guibg=#cad3f5')
vim.cmd('highlight MyGitAdd guifg=#a6da95 guibg=#24273a')
vim.cmd('highlight MyGitRemoved guifg=#ed8796 guibg=#24273a')
vim.cmd('highlight MyGitChanged guifg=#eed49f guibg=#24273a')

local function MyGitContent()
  local mes = vim.b.gitsigns_status_dict
  local status_mes = ''
  if mes == nil then
    return ""
  else
    status_mes = status_mes .. "%#MyGitIcon#" .. "  " .. "%#GitPart#" .. mes.head .. " "
    if mes.added ~= nil then
      status_mes = status_mes .. "%#MyGitAdd#" .. "  " .. mes.added
    end
    if mes.changed ~= nil then
      status_mes = status_mes .. "%#MyGitChanged#" .. "  " .. mes.changed
    end
    if mes.removed ~= nil then
      status_mes = status_mes .. "%#MyGitRemoved#" .. "  " .. mes.removed
    end
    return status_mes
  end
end

Statusline.active = function ()
  return table.concat{
    MyUpdateColor(),
    "  ",
    MyGitContent(),
    "%#MODECOLOR#",
    " ",
    "%m",
    MyReadonly(),
    "%=",
    MyLspInfo(),
    "%#MODECOLOR#",
    MyEncode(),
    GetFileIcon(),
    " ",
    MyUpdateColor(),
    MyLineInfo(),
    " ",
  }
end
vim.o.winbar = "%t: %{%v:lua.require'nvim-navic'.get_location()%}"
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  augroup END
]], false)

