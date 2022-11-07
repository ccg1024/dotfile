-- leader
vim.g.mapleader = ' '

-- buffer, table
vim.api.nvim_set_keymap("n", "<TAB>", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[t", "gT", { noremap = true })
vim.api.nvim_set_keymap("n", "]t", "gt", { noremap = true })


-- Search
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>nohl<CR>", { noremap = true, silent = true })

-- move windows
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })

-- explorer
-- vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- better indent
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })

-- for lspconfig comment keymap
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- for mouse scroll
vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', '5k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', '5j', { noremap = true, silent = true })

-- do not yank with x
vim.keymap.set('n', 'x', '"_x')

-- delete a word with no yank
vim.keymap.set('n', 'dw', 'vaw"_d')

-- Increment/Decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- split window
vim.keymap.set('n', 'ss', ':split<CR><C-w>w', opts)
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w', opts)

-- change spit window size
vim.keymap.set('n', '<C-w><left>', '<C-w><')
vim.keymap.set('n', '<C-w><right>', '<C-w>>')
vim.keymap.set('n', '<C-w><up>', '<C-w>+')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')

-- set new <esc> key map
vim.keymap.set('i', '<C-[>', '<esc>')
