-- colorscheme
vim.opt.background="dark"
vim.opt.termguicolors=true

--gruvbox
vim.g.gruvbox_contrast_dark='dark'
vim.g.gruvbox_sign_column='bg0'
vim.cmd('colorscheme gruvbox')


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
vim.cmd([[
function! MyGitStatus() abort
  let myHead = FugitiveStatusline()
  if empty(myHead)
    return ' [Normal File]'
  endif
  let [a,m,r] = GitGutterGetHunkSummary()
  return " " . myHead . printf(' ﰂ %d  %d  %d', a, m, r)
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

function! LspHints() abort
  let sl = ''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let sl.=':'
    let sl.= luaeval("#vim.diagnostic.get(0, { severity=vim.diagnostic.severity.HINT })")
  else
    let sl.=''
  endif
  return sl
endfunction

function! LspWarns() abort
  let sl = ''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let sl.=':'
    let sl.= luaeval("#vim.diagnostic.get(0, { severity=vim.diagnostic.severity.WARN })")
  else
    let sl.=''
  endif
  return sl
endfunction

function! LspErrors() abort
  let sl = ''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let sl.=':'
    let sl.= luaeval("#vim.diagnostic.get(0, { severity=vim.diagnostic.severity.ERROR })")
  else
    let sl.=''
  endif
  return sl
endfunction

function! NearestMethodOrFunction() abort
  let nerFuc = get(b:, 'vista_nearest_method_or_function', '')
  if empty(nerFuc)
    return ''
  end
  return ' ' . nerFuc
endfunction

highlight STATUSCOLOR cterm=reverse ctermfg=142 ctermbg=235 gui=reverse guifg=#b8bb26 guibg=#282828

" icon ﰂ 8  
set statusline=
set statusline+=%#STATUSCOLOR#
set statusline+=\ %t
" set statusline+=\ %m
set statusline+=\ %{MyGitStatus()}
set statusline+=\ %{NearestMethodOrFunction()}
set statusline+=\%= " separator
set statusline+=\ %{LspErrors()}
set statusline+=\ %{LspWarns()}
set statusline+=\ %{LspHints()}
set statusline+=\ %{ObsessionStatus()}
set statusline+=\ SPACE:\ %{&tabstop}
set statusline+=\ %{MyFileEncode()}
set statusline+=\ %Y
set statusline+=\%4l:\%-2v
set statusline+=\ 
]])

