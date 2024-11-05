return {
  'leath-dub/snipe.nvim',
  keys = {
    {
      '<leader><leader>',
      function()
        require('snipe').open_buffer_menu()
      end,
    },
  },
  opts = {
    hints = {
      dictionary = 'asflewcmpghio',
    },
    navigate = {
      cancel_snipe = 'q',
      close_buffer = 'd',
    },
    sort = 'last',
  },
}
