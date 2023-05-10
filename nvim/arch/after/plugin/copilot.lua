-- get this table to diasble/enable filetypes
vim.g.copilot_filetypes = { xml = false, markdown = false }

-- replace tab to express copilot
vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

vim.cmd [[highlight CopilotSuggestion guifg=#55555555 ctermfg=8]]
