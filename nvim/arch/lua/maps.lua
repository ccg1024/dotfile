local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

keymap.set('n', 'ss', ':split<cr><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<cr><C-w>w', { silent = true })

keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')

keymap.set('n', '<C-n>', '<cmd>nohl<cr>', { noremap = true, silent = true } )

