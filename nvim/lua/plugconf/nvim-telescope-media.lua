-- to avoid two setup{}, add any config of telescope in here.
require'telescope'.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = " ",
    path_display = { "smart" },
    layout_strategy = 'vertical',
    layout_config = { height = 0.75, width = 0.5 },
    mappings = {
      n = {
        ['<c-d>'] = require('telescope.actions').delete_buffer,
      },
      i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer,
      }
    },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
}
require('telescope').load_extension('media_files')
