return {
  'Bekaboo/dropbar.nvim',
  -- optional, but required for fuzzy finder support
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  config = function()
    -- Load the dropbar picker API
    local dropbar_picker = require 'dropbar.api' -- change from 'ai' to 'api'

    -- Set keymap to call dropbar_picker.pick() when <leader>d is pressed
    vim.keymap.set('n', ' d', dropbar_picker.pick, { desc = '[D]ropbar Picker' })
  end,
  opts = {
    menu = {
      win_configs = {
        border = 'string',
        width = 2,
      },
    },
  },
}
