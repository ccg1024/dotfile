">^.^<
"插件
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-surround'
" Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'brach': 'release'}
Plug 'easymotion/vim-easymotion'
" Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'mhinz/vim-startify'
Plug 'lervag/vimtex'
" Plug 'SirVer/ultisnips'
" Plug 'itchyny/vim-cursorword'
"Plug 'dense-analysis/ale'
call plug#end()


syntax enable
set background=dark

"为使用Gruvbox的颜色需要进行设置
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"设置颜色深浅分别为：soft, medium(default), hard
"gruvbox 的设置需要在 colorscheme 之前
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_sign_column='bg0'

colorscheme gruvbox
" highlight clear SignColumn
" highlight! link SignColumn LineNr
" autocmd ColorScheme * highlight! link SignColumn LineNr
" 关于signcolum 颜色不对问题，通过设置gruvbox就可以解决

" set relativenumber
set guioptions=
set number
set wrap
set smartindent
set autoindent
" set cindent
"显示当前按下的操作符
set showcmd
set encoding=utf-8
"光标所在行高亮
set cursorline
set cursorlineopt=line
"显示状态栏，0不显示，1多窗口显示，2都显示
set laststatus=2
"在状态栏显示光标位置
set ruler
"不创建备份文件
set nobackup
"不创建交换文件
set noswapfile
"设置TAB宽度，ts为tabstop缩写
set tabstop=4
"在编辑中，存在tab使用的地方一次性删除一个tab
set softtabstop=4
"设置每一级缩进长度
set shiftwidth=4
"设置TAB内容为空格
set expandtab
"将命令行的选项卡完整选项显示为菜单
set wildmenu
"设置查找高亮
set hlsearch
set mouse=a
"在81列显示竖线
""set colorcolumn=100
set completeopt=longest,noinsert,menuone,noselect,preview
set viewoptions=cursor,folds,slash,unix
" set noshowmode
"set guifont=DejaVu_Sans_Mono_for_Powerline:h16
" set guifont=Hack_Nerd_Font_Mono:h16
"set guifont=Hack_Nerd_Font:h18
set guifont=JetBrainsMono_Nerd_Font_Mono:h16

set splitright
set splitbelow
set virtualedit=block
"使用双字宽显示，不然像 nerd font 的一些字体会显示不完全
" set ambiwidth=double
set signcolumn=yes
"创建leader
"在normal模式下：-,H,L,<space>,<cr>,<bs>是没有映射任何操作的
let mapleader=" "

"开启文件类型检查
filetype indent on

nnoremap <leader>n :CocCommand explorer<cr>

nnoremap ; :
"重新加载配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>
"设置buffer的切换
nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>

"设置Tab的切换
nnoremap [t gT
nnoremap ]t gt

nnoremap ma mA
nnoremap ms mS
nnoremap md mD
nnoremap 'a 'A
nnoremap 's 'S
nnoremap 'd 'D

"关闭当前查找的高亮
nnoremap <c-n> :nohl<cr>

" run code
" '%' denote the current file full path.
" if want show how much time cost after run code
" add 'time' command, use python script as example
" execute '!time python %'
function MyRunFunc()
    if &filetype == 'python'
        execute "!python %"
    elseif &filetype == 'java'
        execute "!javac %"
        execute "!java %<"
    endif
endfunction

nnoremap <F5> :call MyRunFunc()<cr>


"设置在插入模式中将当前单词全部大写
"该设置只适合苹果 D 表示 command 按键
inoremap <d-u> <esc>viw<s-u>ea
inoremap <s-cr> <esc>o

"与系统剪切版同步，vim到复制是放入不同到寄存器中
"但直接用y复制不会放入系统剪切板对应到寄存器中
"需要手动指明，系统剪切板对应到是"与*表示到寄存器，通过 :reg 查看
"例如在可视模式中，使用 "+y 就可以将内容复制到系统剪切板中
"同理，使用 "+p 就可以将系统剪切板中的内容粘贴过来
"命令中以及查看中，第一个字符都是双引号，应该是表示在操作寄存器
"set clipboard=unnamed
"set clipboard=unnamedplus
"上面内容为百度内容，但macvim开启有时会出现y复制但那如与p粘贴的内容不一致w问题
"根据官网文档，y,d,x,c,s 的操作会将内容放入 unameed 寄存器。所以开启以下s设置
"就同步系统剪切板
set clipboard=unnamed


"""""""""""""""""""""""
"vim-airline
"""""""""""""""""""""""
let g:airline_powerline_fonts=1 
let g:airline#extensions#tabline#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#left_seq='▶'
" let g:airline#extensions#tabline#left_alt_seq='❯'
" let g:airline#extensions#tabline#right_seq='◀'
" let g:ariline#extensions#tabline#right_alt_seq='❮'
let g:airline_symbols.linenr='¶'
" " need other plug(vim-fugitive) to show branch symbol.
let g:airline_symbols.branch=''
let g:airline_symbols.readonly="\ue0a2"

" change the status line symbol
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='gruvbox'
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
    \ 'coc-java']

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-l>'
imap <C-e> <Plug>(coc-snippets-expand-jump)

"""""""""""""""""""""""
"ale
"""""""""""""""""""""""
"配合CocConfig里面的displayByAle:true，可以让Ale与coc.nvim一起使用
"let g:ale_disable_lsp = 1

"""""""""""""""""""""""
"indentLine
"""""""""""""""""""""""
" let g:indentLine_char_list=['|']
" let g:indentLine_color_gui = '#7B7D7D'
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2


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
"auto-pairs
"""""""""""""""""""""""
let g:AutoPairsMapCR = 0



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
