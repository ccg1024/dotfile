require("bufferline").setup{
options = {
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
    }
  }
}
-- vim.cmd([[ highlight BufferLineFill guibg=#282828 ]])
-- the bulow comman will link the BufferlineFill guibg to Normal guibg.
-- cause after update plugin in mac, the catppuccin can not change BufferlineFill color.
-- vim.cmd([[
-- exec 'hi BufferlineFill guibg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
-- ]])
