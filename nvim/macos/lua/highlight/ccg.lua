-- vim.g.neosolarized_contrast = "high"
-- some option for colorscheme
vim.cmd(
  [[
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_transparent_background = 0
]])
vim.cmd('colorscheme gruvbox-material')

local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Color.new("my_base1", '#1d2021')
Color.new("my_base2", '#3c3836')
Group.new("CursorLine", colors.none, colors.my_base1, styles.NONE)
Group.new("CursorLineNr", colors.orange, colors.none, styles.NONE)

vim.cmd [[
  hi DiffAdd guifg=#689d6a
  hi DiffChange guifg=#fabd2f
  hi DiffDelete guifg=#fb4934
]]
