-- for telescope and the its extension
local status, telescope = pcall(require, 'telescope')
if (not status) then
  return
end
local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require('telescope').extensions.file_browser.actions

require 'telescope'.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = " ",
    path_display = { "smart" },
    layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.65 },
    mappings = {
      ['n'] = {
        ['<c-d>'] = actions.delete_buffer,
        ['q'] = actions.close,
      },
      ['i'] = {
        ['<c-d>'] = actions.delete_buffer,
      }
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disable netrw
      hijack_netrw = true,
      mappings = {
        -- custom insert mode mapping
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function() vim.cmd('startinsert') end,
        }
      }
    },
  },
}

-- for extention
telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
vim.keymap.set('n', '<leader>n',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 } })<cr>'
  , opts)
-- open file with vertical split <c-v>
-- optn file with horizontal split <c-x>
