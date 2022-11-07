vim.cmd('filetype plugin indent on')
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_method='skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_mappings_enabled = 0

vim.api.nvim_set_keymap("n", "<localleader>ll", "<plug>(vimtex-compile)", { noremap= true })
vim.api.nvim_set_keymap("n", "<localleader>lv", "<plug>(vimtex-view)", { noremap= true })
vim.api.nvim_set_keymap("n", "<localleader>lk", "<plug>(vimtex-stop)", { noremap= true })


-- vim/nvim option, not vimtex
-- disable text conceal
vim.opt.conceallevel = 0
