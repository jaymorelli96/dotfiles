-- Better escape
vim.keymap.set('i', 'jk', '<Esc>')

-- swap P and p in visual mode (deleted word doesn't stay in the register)
vim.api.nvim_set_keymap('v', 'p', '<S-p>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-p>', 'p', { noremap = true, silent = true })

-- Save text to register c before changing, and preserve default register
vim.api.nvim_set_keymap('n', 'c', '"c"0c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'C', '"c"0C', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'c', '"c"0c', { noremap = true, silent = true })

-- which key
local wk = require 'which-key'

wk.add {
  { '<leader>c', group = '[C]ode' },
  { '<leader>ct', group = '[T]oggle' },
  { '<leader>f', group = '[F]ile' },
  { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
  { '<leader>gh', group = '[H]unk', mode = { 'n', 'v' } },
  { '<leader>gt', group = '[T]oggle', mode = { 'n', 'v' } },
  { '<leader>s', group = '[S]earch' },
  { '<leader>ss', group = '[S]ymbols' },
  { '<leader>sh', group = '[H]elp' },
  { '<leader>t', group = '[T]est' },
  { '<leader>x', group = 'Trouble', mode = { 'n', 'v' } },

  { 'gn', group = '[G]o [N]ext' },
  { 'gp', group = '[G]o [P]revious' },
}
-- Modify files
vim.keymap.set('n', '<leader>fc', '<cmd>close<CR>', { desc = '[F]ile [C]lose' })
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Code
vim.keymap.set('n', '<leader>cn', vim.lsp.buf.rename, { desc = 'Re[n]ame' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<leader>fv', '<C-w>v', { desc = 'Split [V]ertically' })
vim.keymap.set('n', '<leader>fh', '<C-w>s', { desc = 'Split [H]orizontally' })
vim.keymap.set('n', '<leader>fe', '<C-w>=', { desc = 'Make Splits [E]qual Size' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- better navigation
vim.keymap.set('n', 'G', 'Gzz', { desc = 'Go to end of file and center it' })
vim.keymap.set({ 'n', 'v' }, 'gl', '$', { desc = 'Go to end of line' })
vim.keymap.set({ 'n', 'v' }, 'gh', '0', { desc = 'Go to end of line' })
vim.keymap.set('v', 'v', '$', { desc = 'End of line' })

-- Trouble
vim.keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Open trouble workspace diagnostics' })
vim.keymap.set('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble document diagnostics' })
vim.keymap.set('n', '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', { desc = 'Open trouble quickfix list' })
vim.keymap.set('n', '<leader>xl', '<cmd>Trouble loclist toggle<CR>', { desc = 'Open trouble location list' })
vim.keymap.set('n', '<leader>xt', '<cmd>Trouble todo toggle<CR>', { desc = 'Open todos in trouble' })

-- treesitter text object navigation
local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'
-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)
-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

local gs = require 'gitsigns'

-- make sure forward function comes first
local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)

vim.keymap.set({ 'n', 'x', 'o' }, 'gnh', next_hunk_repeat, { desc = '[G]o To [N]ext [H]unk' })
vim.keymap.set({ 'n', 'x', 'o' }, 'gph', prev_hunk_repeat, { desc = '[G]o To [P]revious [H]unk' })
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'Lazy[G]it' })

vim.keymap.set('n', 'gm', '%', { desc = '[G]o To [M]atching Parentheses' })
vim.keymap.set('n', 'ge', function()
  vim.diagnostic.open_float()
end, { desc = '[G]o To [E]rror/Diagnostic' })
vim.keymap.set('n', 'gt', vim.diagnostic.goto_next, { desc = '[G]o To Next [T]rouble' })
vim.keymap.set('n', 'gT', vim.diagnostic.goto_prev, { desc = '[G]o to Previous [T]rouble' })

-- toggle split full screen
-- Store the previous window size
local is_maximized = false
local last_win_height = vim.api.nvim_win_get_height(0)
local last_win_width = vim.api.nvim_win_get_width(0)

function ToggleMaximizeWindow()
  if not is_maximized then
    -- Maximize the current window
    last_win_height = vim.api.nvim_win_get_height(0)
    last_win_width = vim.api.nvim_win_get_width(0)
    vim.cmd 'resize'
    vim.cmd 'vertical resize'
    is_maximized = true
  else
    -- Restore the previous window size
    vim.cmd('resize ' .. last_win_height)
    vim.cmd('vertical resize ' .. last_win_width)
    is_maximized = false
  end
end
-- Bind <leader>m to toggle the window maximization
vim.api.nvim_set_keymap('n', '<leader>m', ':lua ToggleMaximizeWindow()<CR>', { noremap = true, silent = true })
