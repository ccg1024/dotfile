require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "java", "c", "cpp", "python", "lua", "html" },
  },
  autotag = {
    enable = true
  },
  ensure_installed = {
    "tsx",
    'css'
  }
}
