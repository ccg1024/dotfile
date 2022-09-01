require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],
  direction = 'float',
  close_on_exit = true,
}
vim.cmd([[
function! Mterm() abort
  :ToggleTerm direction=horizontal
endfunction
command! Mterm call Mterm()
]])
