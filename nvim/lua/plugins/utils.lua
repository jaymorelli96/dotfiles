-- UTILITIES
return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
}