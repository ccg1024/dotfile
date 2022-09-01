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
    },
    separator_style = 'slant',
    modified_icon = '',
    show_close_icon = false,
  }
}
