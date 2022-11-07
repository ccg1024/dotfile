-- for colorscheme setting
vim.cmd([[
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_transparent_background = 0
let g:gruvbox_material_visual = 'reverse'
]])


vim.cmd('colorscheme gruvbox-material')

local Color, colors, Group, groups, styles = require('colorbuddy').setup()

-- Color.new("black", "#000000")
-- -- name fg bg style guisp blend
-- Group.new("CursorLine", colors.black, colors.orange, styles.NONE, colors.orange)
-- Group.new("CursorLineNr", colors.yellow, colors.none, styles.NONE, colors.none)
Color.new("my_base1", '#1d2021')
Color.new("my_base2", '#3c3836')
Group.new("CursorLine", colors.none, colors.my_base1, styles.NONE)
Group.new("CursorLineNr", colors.orange, colors.none, styles.NONE)
