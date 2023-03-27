-- the web address
-- https://gist.github.com/s1n7ax/3d2b476ecbde72693572b8652044e5a4
local M = {}

-- vim.api.nvim_set_hl(0, 'WinBarPath', { bg = '#dedede', fg = '#363636' })
-- vim.api.nvim_set_hl(0, 'WinBarModified', { bg = '#dedede', fg = '#ff3838' })
vim.api.nvim_set_hl(0, 'WinBarPath', { fg = '#268BD2' })

function M.eval()
  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  -- local modified = vim.api.nvim_eval_statusline('%M', {}).str == '+' and '⊚' or ''

  -- icons   
  file_path = file_path:gsub('/', '  ')

  return '  '
      .. '%#WinBarPath#'
      .. file_path
  -- return '%#WinBarPath#'
  --     .. file_path
  --     .. '%*'
  --     .. '%#WinBarModified#'
  --     .. modified
  --     .. '%*'
end

return M
