local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
  sort_by = "name",
  view = {
    mappings = {
      list = {
        { key = 'l', action = "edit"},
        { key = 'h', action = "close_node" },
        { key = 'v', action = 'vsplit' },
        { key = 's', action = 'split' },
        { key = 't', action = 'tabnew' },
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
}
