-- colorscheme
vim.opt.background="dark"
vim.opt.termguicolors=true


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

-- lsp
--vim.lsp.set_log_level("debug")

-- globle value
-- """""""""""""""""""""""""""""""""""""""""""""""""""
-- " file browser
-- " just use command :Lexplore
-- " a default file explore for nvim
-- """""""""""""""""""""""""""""""""""""""""""""""""""

-- python3
vim.g.python3_host_prog = "/usr/bin/python3"

-- vimL
vim.cmd([[
set nobackup
set noswapfile
autocmd FileType lua,vim set shiftwidth=2 tabstop=2 softtabstop=2

let g:gruvbox_contrast_dark='dark'
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox


function! MyGitStatus() abort
  let myHead = FugitiveStatusline()
  if empty(myHead)
    return ''
  endif

  let [a,m,r] = GitGutterGetHunkSummary()
  return " " . myHead . printf(' +%d ~%d -%d', a, m, r)
endfunction

function! MyFileEncode() abort
  if &fileencoding == ""
    if &encoding != ""
      return toupper(&encoding)
    else
      return "NONE"
    endif
  else
    return toupper(&fileencoding)
  endif
endfunction

set statusline=
set statusline+=\ %f
" set statusline+=\ %m
set statusline+=\ %{MyGitStatus()}
set statusline+=\%= " separator
set statusline+=\ %{ObsessionStatus()}
set statusline+=\ %{MyFileEncode()}
set statusline+=\ %Y
set statusline+=\ %l:\%v
set statusline+=\ 
]])

