require("nvim-tree").setup({
  update_cwd = true,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = {"<CR>", "o", "l"}, action = "edit" },
      },
    },
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = false, -- show hidden file
  },
  diagnostics = {
    enable = true,
  },
})
