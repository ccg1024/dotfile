vim.g.vista_default_executive = 'nvim_lsp'
vim.cmd('let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]')
vim.cmd('let g:vista_fzf_preview = [\'right:50%\']')
vim.cmd('let g:vista#renderer#enable_icon = 1')
vim.cmd([[
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }
]])

vim.api.nvim_set_keymap("n", "<leader>v", ":Vista!!<CR>", { noremap = true, silent = true })

-- auto-start vista
-- vim.cmd('autocmd VimEnter * call vista#RunForNearestMethodOrFunction()')
