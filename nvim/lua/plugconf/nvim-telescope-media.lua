-- to avoid two setup{}, add any config of telescope in here.
require'telescope'.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = " ",
    path_display = { "smart" },
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
