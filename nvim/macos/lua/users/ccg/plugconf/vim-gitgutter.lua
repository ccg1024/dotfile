vim.g.gitgutter_sign_allow_clobber = 0
vim.g.gitgutter_set_sign_backgrounds = 1
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_preview_win_floating = 1
vim.g.gitgutter_sign_added = '▎'
vim.g.gitgutter_sign_modified = '░'
vim.g.gitgutter_sign_removed = '▎'
vim.g.gitgutter_sign_removed_first_line = '▔'
vim.g.gitgutter_sign_modified_removed = '▒'
vim.cmd([[
highlight GitGutterAdd    guifg=#8ec07c ctermfg=108
highlight GitGutterChange guifg=#fabd2f ctermfg=214
highlight GitGutterDelete guifg=#cc241d ctermfg=124
]])
