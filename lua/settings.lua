-- some nvim options setting.
-- colorscheme
vim.opt.background="dark"
vim.opt.termguicolors=true

--gruvbox
vim.g.gruvbox_contrast_dark='dark'
vim.g.gruvbox_sign_column='bg0'
-- change scheme in catppuccin.lua file.
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- vim.cmd('colorscheme catppuccin')


-- nomal set
vim.opt.number=true
vim.opt.wrap=true
vim.opt.smartindent=true
vim.opt.autoindent=true
vim.opt.showcmd=true
vim.opt.cursorline=true
vim.opt.ruler=true
vim.opt.expandtab=true
vim.opt.wildmenu=true
vim.opt.hlsearch=true
vim.opt.splitright=true
vim.opt.splitbelow=true
vim.opt.hidden=true
vim.opt.backup=false
vim.opt.swapfile=false
vim.opt.showmode=false

vim.opt.laststatus=3
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.updatetime=100

vim.opt.encoding="utf-8"
vim.opt.mouse="a"
vim.opt.virtualedit="block"
vim.opt.signcolumn="yes"
vim.opt.path:append("**")
vim.opt.clipboard:append("unnamed")
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt="menu,menuone,noselect"
vim.opt.shortmess:append("c")


-- globle value
-- """""""""""""""""""""""""""""""""""""""""""""""""""
-- " file browser
-- " just use command :Lexplore
-- " a default file explore for nvim
-- """""""""""""""""""""""""""""""""""""""""""""""""""

-- python3
vim.g.python3_host_prog = "/usr/bin/python3"

-- vimL
vim.cmd('autocmd FileType lua,vim set shiftwidth=2 tabstop=2 softtabstop=2')
