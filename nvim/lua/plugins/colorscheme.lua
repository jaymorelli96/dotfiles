return {
  'shaunsingh/nord.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- true colors for terminal
    vim.opt.termguicolors = true

    -- Example config in lua
    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    vim.g.nord_disable_background = false
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = true

    vim.cmd.colorscheme 'nord'
  end,
}
