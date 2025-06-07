-- colorschema
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- normal set
vim.opt.number = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.expandtab = true
vim.opt.wildmenu = true
vim.opt.hlsearch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.relativenumber = true

vim.opt.laststatus = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.updatetime = 100

vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.virtualedit = "block"
vim.opt.signcolumn = "yes"
vim.opt.path:append("**")
vim.opt.clipboard:append("unnamed")
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append("c")
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.inccommand = "split"
vim.opt.backspace = "start,eol,indent"

vim.opt.formatoptions:append({ "r" })
vim.opt.shell = "zsh"
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.scrolloff = 10
