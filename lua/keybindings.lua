-- make key map.
-- leader
vim.g.mapleader = ' '

-- buffer, table
vim.api.nvim_set_keymap("n", "<TAB>", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[t", "gT", { noremap = true })
vim.api.nvim_set_keymap("n", "]t", "gt", { noremap = true })

-- marks
-- vim.api.nvim_set_keymap("n", "ma", "mA", { noremap = true })
-- vim.api.nvim_set_keymap("n", "ms", "mS", { noremap = true })
-- vim.api.nvim_set_keymap("n", "md", "mD", { noremap = true })
-- vim.api.nvim_set_keymap("n", "'a", "'A", { noremap = true })
-- vim.api.nvim_set_keymap("n", "'s", "'S", { noremap = true })
-- vim.api.nvim_set_keymap("n", "'d", "'D", { noremap = true })

-- Search
vim.api.nvim_set_keymap("n", "<C-n>", ":nohl<CR>", { noremap = true })

-- move windows
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })

-- explorer
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- better indent
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })

-- remap H, L
vim.api.nvim_set_keymap("n", "H", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true })
vim.api.nvim_set_keymap("n", "yL", "y$", { noremap = true })
vim.api.nvim_set_keymap("n", "yH", "y^", { noremap = true })
vim.api.nvim_set_keymap("v", "H", "^", { noremap = true })
vim.api.nvim_set_keymap("v", "L", "$", { noremap = true })


-- for lspconfig comment keymap
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
