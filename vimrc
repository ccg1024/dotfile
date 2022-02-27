">^.^<
"插件
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'brach': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
"Plug 'dense-analysis/ale'
call plug#end()
"通过 PlugInstall 安装
"tabular最简单的用法，试图模型选中内容输入
":Tabularize /charactor
"其中charactor是用于数据对其的字符，如markdown表格就应该是|
"Tab好像与Tablularize可以互换

"为使用Gruvbox的颜色需要进行设置
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme gruvbox
set background=dark
"设置颜色深浅分别为：soft, medium(default), hard
let g:gruvbox_contrast_dark='medium'

"让两边的滚轮边框消失
set guioptions=
syntax on
set number
set wrap
set smartindent
"显示当前按下的操作符
set showcmd
set encoding=utf-8
"开启文件类型检查
filetype indent on
"光标所在行高亮
set cursorline
"显示状态栏，0不显示，1多窗口显示，2都显示
set laststatus=2
"在状态栏显示光标位置
set ruler
"不创建备份文件
set nobackup
"不创建交换文件
set noswapfile

"设置TAB宽度，ts为tabstop缩写
set ts=4
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

"set guifont=DejaVu_Sans_Mono_for_Powerline:h16
"set guifont=Hack_Nerd_Font_Mono:h16
set guifont=Hack_Nerd_Font:h16

set splitright
set splitbelow
set virtualedit=block
"将系统剪切板与未命名寄存器对应
set clipboard=unnamed
"创建leader
"在normal模式下：-,H,L,<space>,<cr>,<bs>是没有映射任何操作的
let mapleader=" "
nnoremap ; :
"重新加载配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>
"设置buffer的切换
nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>

"设置Tab的切换
nnoremap [t gT
nnoremap ]t gt

"设置标记跳转，m+a-z 表示标记当前位置
" '+a-z 表示跳转到之前标记到位置
"小写字母标记只能在当前文本上跳转，一旦窗口发生变化无法跳转
"大写字母能够任意跳转，这里设置三个任意跳转的小写字母
"使用 :marks 查看当前的标记内容以及一些系统自带的标记 
"通过 :delmarks a b c 能够删除 a b c 的标记位置
nnoremap ma mA
nnoremap ms mS
nnoremap md mD
nnoremap 'a 'A
nnoremap 's 'S
nnoremap 'd 'D

"关闭当前查找的高亮
nnoremap <c-n> :nohl<cr>
"设置括号自动补全的映射
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

"设置在插入模式中将当前单词全部大写
"该设置只适合苹果 D 表示 command 按键
inoremap <d-u> <esc>viw<s-u>ea

"""""""""""""""""""""""
"vim-airline
"""""""""""""""""""""""
let g:airline_powerline_fonts=1 
let g:airline#extensions#tabline#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#left_seq='▶'
let g:airline#extensions#tabline#left_alt_seq='❯'
let g:airline#extensions#tabline#right_seq='◀'
let g:ariline#extensions#tabline#right_alt_seq='❮'
let g:airline_symbols.linenr='¶'
let g:airline_symbols.branch='⎇'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter='default'
let g:airline_theme='gruvbox'

"""""""""""""""""""""""
"vim-markdown
"""""""""""""""""""""""
"取消markdown的折叠
:let g:vim_markdown_folding_disabled=1

"""""""""""""""""""""""
"nerdtree
"""""""""""""""""""""""
"开启或关闭nerdtree目录导航插件
:nnoremap <leader>n :NERDTreeToggle<cr>



"""""""""""""""""""""""
"coc.nvim
"""""""""""""""""""""""
set hidden
set updatetime=100
set shortmess+=c

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
nmap <silent> gi <Plug>(coc-implementation)
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
let g:indentLine_char_list=['|']
let g:indentLine_color_gui = '#7B7D7D'

"""""""""""""""""""""""
"vim-gitgutter
"""""""""""""""""""""""
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
