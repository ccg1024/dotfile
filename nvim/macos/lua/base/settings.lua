-- colorscheme
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- nomal set
vim.opt.number = true
vim.opt.wrap = false
vim.opt.smartindent = true
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
vim.opt.wildignore:append { '*/node_modules/*' }


-- globle value
-- """""""""""""""""""""""""""""""""""""""""""""""""""
-- " file browser
-- " just use command :Lexplore
-- " a default file explore for nvim
-- """""""""""""""""""""""""""""""""""""""""""""""""""

-- python3
vim.g.python3_host_prog = "/Users/ccg/miniforge3/envs/pytorchVenv/bin/python"

-- vimL
vim.cmd('autocmd FileType java,c,cpp,python set shiftwidth=4 tabstop=4 softtabstop=4')

-- from devaslife branch, file highlight.lua
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.inccommand = 'split'
vim.opt.backspace = 'start,eol,indent'

vim.opt.formatoptions:append { 'r' }
vim.opt.shell = 'zsh'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.scrolloff = 10 -- make sure the screen move when the cursor going to top or bottom
