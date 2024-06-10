-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
autocmd FileType * lua vim.api.nvim_buf_set_keymap(0, 'i', '<C-j>', 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<C-j>"', {expr = true, noremap = true})
]])
