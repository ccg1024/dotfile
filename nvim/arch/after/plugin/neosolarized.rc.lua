local status, n = pcall(require, 'neosolarized')
if (not status) then return end

n.setup({
  comment_italics = true
})

local colorbuddy = require('colorbuddy.init')
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

Color.new('black', '#000000')
Group.new('CursorLine', colors.none, colors.base03, styles.NONE)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new('DiagnosticVirtualTextError', cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new('DiagnosticVirtualTextInfo', cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new('DiagnosticVirtualTextWarn', cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new('DiagnosticVirtualTextHint', cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new('DiagnosticUnderlineError', colors.none, colors.none, styles.undercurl, cError)
Group.new('DiagnosticUnderlineInfo', colors.none, colors.none, styles.undercurl, cInfo)
Group.new('DiagnosticUnderlineWarn', colors.none, colors.none, styles.undercurl, cWarn)
Group.new('DiagnosticUnderlineHint', colors.none, colors.none, styles.undercurl, cHint)

vim.cmd [[
  hi DiffAdd guifg=#689d6a
  hi DiffChange guifg=#fabd2f
  hi DiffDelete guifg=#fb4934
]]
