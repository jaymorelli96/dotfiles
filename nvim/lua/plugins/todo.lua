return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local todo_comments = require 'todo-comments'

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', 'gnt', function()
      todo_comments.jump_next()
    end, { desc = '[N]ext [T]odo Comment' })

    keymap.set('n', 'gpt', function()
      todo_comments.jump_prev()
    end, { desc = '[P]revious [T]odo Comment' })

    todo_comments.setup()
  end,
}
