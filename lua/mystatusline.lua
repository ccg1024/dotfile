-- config my statusline content
-- reference site
-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

-- mode map
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

local function Mymode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function LspHints()
  local sl = ''
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    sl = sl .. " :"
    sl = sl .. #vim.diagnostic.get(0, { severity=vim.diagnostic.severity.HINT })
  else
    sl = sl .. " "
  end
  return sl
end

local function LspWarns()
  local sl = ''
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    sl = sl .. " :"
    sl = sl .. #vim.diagnostic.get(0, { severity=vim.diagnostic.severity.WARN })
  else
    sl = sl .. " "
  end
  return sl
end

local function LspErrors()
  local sl = ''
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    sl = sl .. " :"
    sl = sl .. #vim.diagnostic.get(0, { severity=vim.diagnostic.severity.ERROR })
  else
    sl = sl .. " "
  end
  return sl
end

-- local function MyFilename()
--   local fname = vim.fn.expand "%:t"
--   if fname == "" then
--       return ""
--   end
--   -- return fname .. " "
--   return string.format(" %s", fname)
-- end

local function MyFileType()
  return string.format(" %s ", vim.bo.filetype):upper()
end

local function MyLineInfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %P %4l:%-2v "
end

local function MyEncode()
  local fileEncode = vim.bo.fileencoding
  if fileEncode == "" or fileEncode == nil then
    fileEncode = vim.go.encoding
  end
  return string.format(" %s" , string.upper(fileEncode))
end

Statusline = {}
-- vim.cmd('highlight STATUSCOLOR cterm=reverse ctermfg=142 ctermbg=235 gui=reverse guifg=#b8bb26 guibg=#282828')
vim.cmd('highlight STATUSCOLOR guibg=#89b4fa guifg=#000000')
vim.cmd('highlight MODECOLOR gui=bold guibg=#a6e3a1 guifg=#000000')

Statusline.active = function ()
  return table.concat{
    "%#MODECOLOR#",
    Mymode(),
    "%#STATUSCOLOR#",
    " %t",
    "  %{get(b:,'gitsigns_status',' [Normal File]')}",
    "  %-0{%v:lua.require'nvim-navic'.get_location()%}",
    "%=",
    LspErrors(),
    LspWarns(),
    LspHints(),
    " %{ObsessionStatus()}",
    " SPACE: %{&tabstop}",
    MyEncode(),
    MyFileType(),
    MyLineInfo(),
  }
end
-- vim.o.statusline = vim.o.statusline .. "%#STATUSCOLOR#"
-- vim.o.statusline = vim.o.statusline .. " %t"
-- vim.o.statusline = vim.o.statusline .. " %{get(b:,'gitsigns_status',' [Normal File]')}"
-- vim.o.statusline = vim.o.statusline .. "%-0{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.o.statusline = vim.o.statusline .. "%="
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  augroup END
]], false)

