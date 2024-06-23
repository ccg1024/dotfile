-- colorscheme
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.wrap = false
vim.opt.ruler = true -- show the line and column number of cursor
vim.opt.number = true
vim.opt.hidden = true -- hide buffer when abandoned
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.wildmenu = true -- using enhanced mode in command-line menu
vim.opt.expandtab = true -- using <space> to replace <tab>
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smartindent = true

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.laststatus = 3

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2 -- number of <space> when using auto indent
vim.opt.softtabstop = 2 -- when using <space> replace <tab>

vim.opt.pumblend = 5 -- Enables pseudo-transparency of popup-menu, 0-30 is normally used
vim.opt.scrolloff = 5 -- make sure the screen move when the cursor going to top or bottom

vim.opt.mouse = "a" -- allow mouse operate in all mode
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.signcolumn = "yes"
vim.opt.wildoptions = "pum" -- A list of words that change how cmdline-completion is done.
vim.opt.virtualedit = "block" -- Allow virtual editing in Visual block mode.
vim.opt.completeopt = "menu,menuone,noselect" -- show possible completion menu in insert mode

-- split a window to preview when using :substitute command
-- |substitute| command is a replace command, like :s/Hello/Hi/g
vim.opt.inccommand = "split"

-- configure <backspace> work mode
vim.opt.backspace = "start,eol,indent"

-- auto insert comment charactor which locate in line start
vim.opt.formatoptions:append("r")

vim.opt.path:append("**") -- find file recursive, when using :find command
vim.opt.shortmess:append("c") -- setting short-message mode, tap help shortmess check more info
vim.opt.clipboard:append("unnamed,unnamedplus")
vim.opt.wildignore:append({ "*/node_modules/*" }) -- ignore path when using :edit, :find etc
-- append {'xxx', 'yyy'} normally using to append multi string
-- append("xxx") normally using to append single string

-- viml
-- setting tab equal to 4 for some special file type
-- note: cannot insert <space> between file type name, like java, c, cpp
vim.cmd("autocmd FileType java,c,cpp,python set shiftwidth=4 tabstop=4 softtabstop=4")

-- keymap
local keymap = vim.keymap
local opts = { silent = true, noremap = true }

keymap.set("n", "<C-n>", "<CMD>nohl<CR>", opts)

-- move window
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sl", "<C-w>l", opts)
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>j", opts)

-- do not yank with x
keymap.set("n", "x", '"_x', opts)

-- split window
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- change window size
keymap.set("n", "<C-w><left>", "<C-w><", opts)
keymap.set("n", "<C-w><right>", "<C-w>>", opts)
keymap.set("n", "<C-w><up>", "<C-w>+", opts)
keymap.set("n", "<C-w><down>", "<C-w>-", opts)

-- Delete a word backwords
keymap.set("n", "dw", 'vb"_d')

-- Increase/Decrease
keymap.set("n", "+", "<c-a>")
keymap.set("n", "-", "<c-x>")

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)
keymap.set("n", ";e", vim.diagnostic.open_float, opts)
