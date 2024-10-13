-- Better escape
vim.keymap.set('i', 'jk', '<Esc>')

-- Modify files
vim.keymap.set('n', '<leader>fc', '<cmd>close<CR>', { desc = '[F]ile [C]lose' })
vim.keymap.set('n', '<leader>fw', '<cmd>w<CR>', { desc = '[F]ile [W]rite' })
vim.keymap.set('n', '<leader>fq', '<cmd>xa<CR>', { desc = '[F]ile [Q]uit' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- better navigation
vim.keymap.set('n', 'G', 'Gzz', { desc = 'Go to end of line and center it' })
