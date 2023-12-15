-- nvim keymaps

-- insert mode
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', 'kk', '<ESC>:wq<CR>')
vim.keymap.set({'n', 'v'}, 'K', '10k')
vim.keymap.set({'n', 'v'}, 'J', '10j')

-- normal mode
vim.keymap.set('n', '<leader><space>', ':noh<CR>')
vim.keymap.set('n', '<leader>w', '<C-w>v<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-n>', ':bn<CR>')
vim.keymap.set('n', '<C-p>', ':bp<CR>')
vim.keymap.set('n', 'qq', ':q<CR>')
vim.keymap.set('n', '<leader>n', 'ddkP')
vim.keymap.set('n', '<leader>m', 'ddP')
