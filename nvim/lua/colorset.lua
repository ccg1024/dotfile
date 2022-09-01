vim.cmd('colorscheme catppuccin')

-- for some highlight group change
vim.cmd([[
" hi Normal guibg=None
" exec 'hi BufferLineFill guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
" exec 'hi BufferLineTabClose guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
" hi FocusedSymbol gui=bold guifg=#fabd2f
]])
