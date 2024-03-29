-- change status_formatter
local function MyStatusFormatter(status)
  -- local added, changed, removed, head = status.added, status.changed, status.removed, status.head
  local head = status.head
  local status_txt = {}
  -- if head     then table.insert(status_txt, '\uf1d2 '..head) end
  if head     then table.insert(status_txt, ' '..head) end
  -- if added    then table.insert(status_txt, 'ﰂ '..added  )    end
  -- if changed  then table.insert(status_txt, ' '..changed)    end
  -- if removed  then table.insert(status_txt, ' '..removed)    end
  return table.concat(status_txt, ' ')
end

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '▎', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '▒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- for key binding
local opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>h', ':Gitsigns preview_hunk<CR>', opt)
vim.api.nvim_set_keymap('n', '[h', ':Gitsigns prev_hunk<CR>', opt)
vim.api.nvim_set_keymap('n', ']h', ':Gitsigns next_hunk<CR>', opt)
