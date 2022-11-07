require("bufferline").setup{
  options = {
    -- themable = false,
    model = "buffers",
    numbers = "ordinal",
    -- diagnostics = "nvim_lsp",
    color_icons = true,
    always_show_bufferline = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlight = "Directory",
        text_align = "left"
      }
    },
    separator_style = 'thick',
    show_close_icon = false,
  }
}
-- vim.cmd([[ highlight BufferLineFill guibg=#1e1e2e ]])
-- vim.cmd([[
-- exec 'hi BufferLineFill guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
-- exec 'hi BufferLineTabClose guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
-- ]])
