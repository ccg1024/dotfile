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
  return string.format(" %s" , string.upper(fileEncode))
end

Statusline = {}
vim.cmd([[exec 'hi MODECOLOR gui=bold guifg=#eed49f guibg=' . synIDattr(synIDtrans(hlID('NvimTreeNormal')), 'bg', 'gui')]])
vim.cmd('highlight MyStatusLineFlag guibg=#0096ff')
vim.cmd('highlight MyStatusLineFlagI guibg=#F15412')
vim.cmd('highlight MyStatusLineFlagV guibg=#FFFFDE')
vim.cmd([[exec 'highlight MyFlagIcon gui=bold guifg=#0096ff guibg=' . synIDattr(synIDtrans(hlID('MODECOLOR')), 'bg', 'gui')]])
vim.cmd([[exec 'highlight MyFlagIconI gui=bold guifg=#F15412 guibg=' . synIDattr(synIDtrans(hlID('MODECOLOR')), 'bg', 'gui')]])
vim.cmd([[exec 'highlight MyFlagIconV gui=bold guifg=#FFFFDE guibg=' . synIDattr(synIDtrans(hlID('MODECOLOR')), 'bg', 'gui')]])

Statusline.active = function ()
  return table.concat{
    MyUpdateColor(),
    " ",
    MyIconColor(),
    " ",
    Mymode(),
    "%#MODECOLOR#",
    "%m",
    " %{get(b:,'gitsigns_status','')}",
    "  ",
    "%=",
    "%<",
    "%f",
    "%=",
    -- LspErrors(),
    -- LspWarns(),
    -- LspHints(),
    " %{ObsessionStatus()}",
    " Space: %{&tabstop}",
    MyEncode(),
    MyFileType(),
    MyLineInfo(),
    MyUpdateColor(),
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

