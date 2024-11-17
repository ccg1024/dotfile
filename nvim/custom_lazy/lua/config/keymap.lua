local opt = { noremap = true, silent = true }

-- Search
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>nohl<cr>", opt)

-- Move windows
vim.api.nvim_set_keymap("n", "sk", "<C-w>k", opt)
vim.api.nvim_set_keymap("n", "sl", "<C-w>l", opt)
vim.api.nvim_set_keymap("n", "sj", "<C-w>j", opt)
vim.api.nvim_set_keymap("n", "sh", "<C-w>h", opt)

-- Better indent
vim.api.nvim_set_keymap("v", "<", "<gv", opt)
vim.api.nvim_set_keymap("v", ">", ">gv", opt)

-- Do not yank with x
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "dw", '"_diw')

-- Split window
vim.keymap.set("n", "ss", "<cmd>split<cr>", opt)
vim.keymap.set("n", "sv", "<cmd>vsplit<cr>", opt)

-- Change spit window size
vim.keymap.set('n', '<C-w><left>', '<C-w><')
vim.keymap.set('n', '<C-w><right>', '<C-w>>')
vim.keymap.set('n', '<C-w><up>', '<C-w>+')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')

-- for lsp
vim.keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
vim.keymap.set("n", ";e", vim.diagnostic.open_float, opts)
