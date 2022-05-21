">^.^<
"插件
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'brach': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'mhinz/vim-startify'
Plug 'lervag/vimtex'
Plug 'kshenoy/vim-signature'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()


syntax enable
set background=dark

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" let g:gruvbox_contrast_dark='medium'
" let g:gruvbox_sign_column='bg0'
" colorscheme gruvbox
colorscheme dracula

" hi Normal guibg=NONE ctermbg=NONE

" set t_Co=256 
set guioptions=
set nocompatible
set number
set wrap
set smartindent
set autoindent
set showcmd
set encoding=utf-8
set cursorline
set laststatus=2
set ruler
set nobackup
set noswapfile
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set hlsearch
set mouse=a
set completeopt=longest,noinsert,menuone,noselect,preview
set viewoptions=cursor,folds,slash,unix

set splitright
set splitbelow
set virtualedit=block
set signcolumn=yes
let mapleader=" "

"set cursor shape in iterm2
au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
au VimLeave,VimSuspend * set guicursor=a:blinkon0


filetype indent on

nnoremap <leader>n :CocCommand explorer<cr>
nnoremap <leader>F :Files<cr>

nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>

nnoremap [t gT
nnoremap ]t gt

nnoremap ma mA
nnoremap ms mS
nnoremap md mD
nnoremap 'a 'A
nnoremap 's 'S
nnoremap 'd 'D

nnoremap <c-n> :nohl<cr>
nnoremap <c-j> 5j
nnoremap <c-k> 5k
nnoremap <c-h> 5h
nnoremap <c-l> 5l
vnoremap <c-j> 5j
vnoremap <c-k> 5k
vnoremap <c-h> 5h
vnoremap <c-l> 5l

" run code
" '%' denote the current file full path.
" if want show how much time cost after run code
" add 'time' command, use python script as example
" execute '!time python %'
function MyRunFunc()
    if &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'java'
        set splitbelow
        :sp
        :res -5
        :term javac % && time java %<
    endif
endfunction

function! MRun()
    if &filetype == 'python'
        execute "!python % > output.txt"
    elseif &filetype == 'java'
        execute "!javac %"
        execute "!java %<"
    endif

    execute "vsplit output.txt"
endfunction

nnoremap <F5> :call MyRunFunc()<cr>
command! Mr call MyRunFunc()

inoremap <d-u> <esc>viw<s-u>ea
inoremap <s-cr> <esc>o

set clipboard=unnamed
set gcr=a:blinkon0

highlight clear CursorLineNr
highlight CursorLineNr term=bold ctermfg=214 guifg=#fabd2f 


"""""""""""""""""""""""
"vim-airline
"""""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_symbols.linenr=''
" " need other plug(vim-fugitive) to show branch symbol.
let g:airline_symbols.branch=''
let g:airline_symbols.readonly="\ue0a2"

" change the status line symbol
"          
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = '▏'
" let g:airline_right_alt_sep = '▏'
" let g:airline_right_sep = ''

let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='dracula'
" show the number of change / delete / add
let g:airline#extensions#hunks#enabled=1
" show the branch symbol
let g:airline#extensions#branch#enabled=1


"""""""""""""""""""""""
"vim-markdown
"""""""""""""""""""""""
"取消markdown的折叠
let g:vim_markdown_folding_disabled=1

" syntax conceal
set conceallevel=0
" latex math
let g:vim_markdown_math = 1
" yaml front matter
let g:vim_markdown_frontmatter = 1
" strikethrough
let g:vim_markdown_strikethrough = 1
highlight htmlBold gui=bold guifg=orange


"""""""""""""""""""""""
"nerdtree
"""""""""""""""""""""""
"开启或关闭nerdtree目录导航插件
" nnoremap <leader>n :NERDTreeToggle<cr>



"""""""""""""""""""""""
"coc.nvim
"""""""""""""""""""""""
set hidden
set updatetime=100
set shortmess+=c

" if has("nvim-0.5.0") || has("patch-8.1.1564")
"     set signcolumn=number
" else
"     set signcolumn=yes
" endif

"使用tab来出发代码补全，前面有字符的情况
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" open complication bar again
inoremap <silent><expr> <c-o> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"上下错误跳转
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gI <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"同名变量高亮
autocmd CursorHold * silent call CocActionAsync('highlight')
" highlight CocHighlightText guibg=#fe8019 ctermbg=208

"rename elements
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
    \ 'coc-vimlsp',
    \ 'coc-snippets',
    \ 'coc-pyright',
    \ 'coc-json',
    \ 'coc-java',
    \ 'coc-explorer',
    \ 'coc-pairs']

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
" let g:coc_snippet_prev = '<c-l>'
imap <C-e> <Plug>(coc-snippets-expand-jump)


""""""""""""""""""""""
"vim-gitgutter
"""""""""""""""""""""""
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

"""""""""""""""""""""""
"vista
"""""""""""""""""""""""
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


"""""""""""""""""""""""
"fzf.vim
"""""""""""""""""""""""
" let g:fzf_preview_window = 'right:60%'
" using :Files to open fzf windows

"""""""""""""""""""""""
"coc-explorer
"""""""""""""""""""""""
" nmap <leader>e :CocCommand explorer<CR>
" nmap <leader>f :CocCommand explorer --preset floating<CR>
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


"""""""""""""""""""""""
"glyph-palette
"""""""""""""""""""""""
" let g:glyph_palette#palette='GlyphPalette1'
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern,nerdtree,startify,coc-explorer call glyph_palette#apply()
augroup END



"""""""""""""""""""""""
"vimtex
"for latex
"""""""""""""""""""""""
filetype plugin indent on

" let g:vimtex_view_method = 'zathura'

" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" let g:vimtex_compiler_method = 'latexrun'

let g:tex_flavor = 'xelatex'

" close auto open error window, use :copen to open error window
let g:vimtex_quickfix_mode = 0

let g:vimtex_view_method='skim'
let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_activate = 1
" use this commentray to set the compile version
" % !TEX program = xelatex
" put the commentray above on the top of tex file


"""""""""""""""""""""""
"vim-signature
"show marks in signcolumn
""""""""""""""""""""""""

"""""""""""""""""""""""
"easymotion
"make some seting for nvim
"got some error when using this plug with coc.nvim
""""""""""""""""""""""""
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

"""""""""""""""""""""""
"vim-markdown-preview
"""""""""""""""""""""""
" let g:mkdp_browser = 'chrome'
