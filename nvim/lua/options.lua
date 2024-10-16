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

vim.api.nvim_set_hl(0, 'NoicePopupmenuBorder', { bg = '#2e3440', fg = '#a3be8c' })

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

vim.diagnostic.config {
  float = { border = 'rounded' },
}

-- Customize diagnostic signs (icons) for the sidebar
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- wrap open_float to inspect diagnostics and use the severity color for border
-- https://neovim.discourse.group/t/lsp-diagnostics-how-and-where-to-retrieve-severity-level-to-customise-border-color/1679
vim.diagnostic.open_float = (function(orig)
  return function(bufnr, opts)
    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
    local opts = opts or {}
    -- A more robust solution would check the "scope" value in `opts` to
    -- determine where to get diagnostics from, but if you're only using
    -- this for your own purposes you can make it as simple as you like
    local diagnostics = vim.diagnostic.get(opts.bufnr or 0, { lnum = lnum })
    local max_severity = vim.diagnostic.severity.HINT
    for _, d in ipairs(diagnostics) do
      -- Equality is "less than" based on how the severities are encoded
      if d.severity < max_severity then
        max_severity = d.severity
      end
    end
    local border_color = ({
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
      [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
      [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
      [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
    })[max_severity]

    -- Custom format function
    opts.format = function(diagnostic)
      -- Define symbols for each diagnostic severity
      local severity_symbols = {
        [vim.diagnostic.severity.ERROR] = '', -- Error symbol
        [vim.diagnostic.severity.WARN] = '', -- Warning symbol
        [vim.diagnostic.severity.INFO] = '', -- Info symbol
        [vim.diagnostic.severity.HINT] = '', -- Hint symbol
      }

      -- Get the severity symbol and format the message
      local severity_symbol = severity_symbols[diagnostic.severity] or ''
      local source = diagnostic.source or 'Unknown' -- Get diagnostic source if available
      local msg = diagnostic.message
      local formatted_msg = ''

      -- Function to wrap long lines at 100 characters, while preserving existing line breaks
      local function wrap_line(line, width)
        local wrapped_lines = {}
        -- Process the line, wrapping it if it's too long
        while #line > width do
          table.insert(wrapped_lines, line:sub(1, width) .. ' ') -- Take the first 'width' characters
          line = line:sub(width + 1) -- Continue with the rest of the line
        end
        table.insert(wrapped_lines, line) -- Add the remaining part of the line
        return table.concat(wrapped_lines, '\n\t') -- Return the wrapped line
      end

      -- Process each line separately, preserving existing newlines
      for line in msg:gmatch '[^\r\n]+' do
        -- If the line exceeds 100 characters, wrap it
        if #line > 100 then
          formatted_msg = formatted_msg .. wrap_line(line, 100) .. ' \n\t'
        else
          formatted_msg = formatted_msg .. line .. ' \n\t' -- Otherwise, keep it as is
        end
      end

      formatted_msg = formatted_msg:gsub('%s*\n$', '')

      -- Now `formatted_msg` contains the full message with line breaks every 126 characters
      return string.format('%s [%s] %s', severity_symbol, source, formatted_msg)
    end
    opts.severity_sort = true
    opts.source = false
    opts.header = ' '
    opts.prefix = ' '
    opts.suffix = ' '
    opts.border = {
      { '╭', border_color },
      { '─', border_color },
      { '╮', border_color },
      { '│', border_color },
      { '╯', border_color },
      { '─', border_color },
      { '╰', border_color },
      { '│', border_color },
    }

    orig(bufnr, opts)
  end
end)(vim.diagnostic.open_float)

-- Show line diagnostics in floating popup on hover, except insert mode (CursorHoldI)
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]

-- Show source in diagnostics, not inline but as a floating popup
vim.diagnostic.config {
  virtual_text = false,
  float = {
    source = true, -- Or "if_many"
  },
}
