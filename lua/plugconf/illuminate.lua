vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree", "DressingSelect" }
vim.g.Illuminate_ftwhitelist = { 'vim', 'sh', 'python', 'lua', 'java' }
vim.cmd([[
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END
]])
vim.api.nvim_command [[ hi LspReferenceText cterm=underline gui=underline ]]
vim.api.nvim_command [[ hi LspReferenceWrite cterm=underline gui=underline ]]
vim.api.nvim_command [[ hi LspReferenceRead cterm=underline gui=underline ]]
