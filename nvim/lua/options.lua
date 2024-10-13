-- [[ Global Options ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.cmdheight = 0

-- [[ Highlight Groups ]]
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, 'TelescopeResultBorder', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, 'TelescopeSelectionBorder', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = '#5e81ac' })
vim.api.nvim_set_hl(0, '@lsp.type.enumMember', { fg = '#5e81ac' })

-- [[ Setting options ]]
local opt = vim.opt

opt.number = true

opt.mouse = 'a'

opt.showmode = false -- Don't show the mode, since it's already in the status line

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

opt.breakindent = true

opt.undofile = true -- Save undo history

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 500

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = false
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- true colors for terminal
opt.termguicolors = true

-- [[ Basic Autocommands ]]
-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
