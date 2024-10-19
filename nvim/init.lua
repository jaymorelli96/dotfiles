vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'config.lazy'
require 'options'
require 'keys'

vim.diagnostic.config {
  virtual_text = {
    prefix = ' ●', -- Custom icon
    suffix = ' ', -- Custom icon
    format = function(diagnostic)
      return string.format('%s', diagnostic.message)
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}
