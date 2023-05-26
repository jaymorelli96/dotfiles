lvim.plugins = {
  { "sainnhe/everforest" },
  { "morhetz/gruvbox" },
  { "catppuccin/nvim",   name = "catppuccin" },

  { "folke/trouble.nvim" },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/noice.nvim",
    config = function()
      require("user.configs.noice")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end
  },

  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
  },

  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },

  { "ThePrimeagen/harpoon" },

  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  { "christoomey/vim-tmux-navigator" },

  { "fatih/vim-go" },

  { "SirVer/ultisnips" },
  { "quangnguyen30192/cmp-nvim-ultisnips" },


  {
    "epwalsh/obsidian.nvim",
    lazy = false,
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/Notes/**.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    opts = require("user.configs.obzdn"),
    config = function(_, opts)
      require("obsidian").setup(opts)
      vim.keymap.set("n", "gf", function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end, { noremap = false, expr = true })
    end,
  },
}
