-- [[ Global Options ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.cmdheight = 0

vim.opt.autowriteall = true -- autosave

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.loaded_tutor_mode_plugin = 1

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

vim.api.nvim_set_hl(0, 'DiffAdd', { fg = '#a3be8c' })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = '#ebcb8b' })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#bf616a' })

vim.api.nvim_set_hl(0, 'DropBarIconUIPickPivot', { fg = '#88c0d0' })
vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { fg = '#88c0d0' })
vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { fg = '#4c566a' })
vim.api.nvim_set_hl(0, 'DropBarMenuHoverIcon', { reverse = false, bg = 'none', fg = '#ebcb8b' })
vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { bg = '#3b4252' })
vim.api.nvim_set_hl(0, 'DropBarMenuFloatBorder', { bg = '#2e3440', fg = '#5e81ac' })

vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#2e3440', fg = '#5e81ac' })

-- [[ Setting options ]]
local opt = vim.opt

-- true colors for terminal
opt.termguicolors = true

opt.number = true

opt.mouse = 'a'

opt.showmode = false -- Don't show the mode, since it's already in the status line

opt.laststatus = 0

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

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

vim.opt.guicursor = 'n-v-c-i:block'

-- Enable cursor line
vim.opt.cursorline = true
-- Enable cursor line
vim.opt.cursorline = true

-- Set the default cursor line color for Normal mode
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#3b4252' })

-- Create a new augroup to group the autocmds
local group = vim.api.nvim_create_augroup('ChangeCursorLineColor', { clear = true })

-- Autocommand for Insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  group = group,
  callback = function()
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = group,
  callback = function()
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#3b4252' })
  end,
})

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- [[ Basic Autocommands ]]
-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
  desc = 'Start Neo-tree with directory',
  once = true,
  callback = function()
    if package.loaded['neo-tree'] then
      return
    else
      ---@diagnostic disable-next-line: param-type-mismatch
      local stats = vim.uv.fs_stat(vim.fn.argv(0))
      if stats and stats.type == 'directory' then
        require 'neo-tree'
      end
    end
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--

if vim.fn.has 'wsl' == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enable = 0,
  }
end
