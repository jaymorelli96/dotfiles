return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      build = 'make',

      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require 'telescope.actions'
    local open_with_trouble = require('trouble.sources.telescope').open

    -- [[ Configure Telescope ]]
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      defaults = {
        mappings = {
          i = {
            ['<C-h>'] = 'which_key',
            ['<esc>'] = actions.close,
            ['jk'] = { '<esc>', type = 'command' },
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<c-t>'] = open_with_trouble,
          },
          n = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<c-t>'] = open_with_trouble,
          },
        },
        prompt_prefix = '󰭎 ',
        layout_strategy = 'vertical',
        selection_caret = ' ',
        sorting_strategy = 'ascending',
        color_devicons = true,
        -- winblend = 5,
        layout_config = {
          preview_cutoff = 10, -- Ensure the preview appears when there are enough lines in the window
          vertical = {
            prompt_position = 'top',
            preview_height = 0.5, -- Make the preview window wider (70% of total window)
            width = 65,
            height = 0.9,
            mirror = false,
            results_height = 10,
          },
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.6, -- Make the preview window wider (70% of total window)
            results_width = 0.4, -- Results window is narrower (30%)
          },
        },
      },
      pickers = {
        find_files = {
          find_command = {
            'fd',
            '--type',
            'f',
            '--strip-cwd-prefix',
            '--hidden',
            '--follow',
            '--exclude',
            '.git',
            '--exclude',
            'node_modules',
            '--exclude',
            '.node_modules',
          },
          prompt_title = 'Find',
          sorting_strategy = 'ascending',
          previewer = false,
        },
        oldfiles = {
          prompt_title = 'Recent',
          sorting_strategy = 'ascending',
          hidden = true,
          previewer = true,
          layout_config = {
            vertical = {
              width = 80,
            },
          },
        },
        diagnostics = {
          previewer = true,
          layout_config = {
            vertical = {
              width = 100,
            },
          },
        },
        buffers = {
          previewer = false,
          sorting_strategy = 'ascending',
          results_title = '',
          layout_config = {
            vertical = {
              height = 0.3,
            },
          },
        },
        grep_string = {
          layout_strategy = 'horizontal',
        },
        live_grep = {
          layout_strategy = 'horizontal',
        },
        highlights = {
          layout_config = {
            width = 80,
          },
        },
        git_commits = {
          layout_config = {
            width = 100,
          },
        },
        builtin = {
          previewer = false,
        },
        lsp_document_symbols = {
          layout_strategy = 'horizontal',
          ignore_symbols = { 'variable', 'field' },
        },
        lsp_references = {
          layout_strategy = 'horizontal',
        },
        lsp_definitions = {
          layout_strategy = 'horizontal',
        },
        lsp_incoming_calls = {
          layout_strategy = 'horizontal',
        },
        lsp_outgoing_calls = {
          layout_strategy = 'horizontal',
        },
        lsp_implementations = {
          layout_strategy = 'horizontal',
        },
        lsp_type_definitions = {
          layout_strategy = 'horizontal',
        },
        keymaps = {
          layout_config = {
            vertical = {
              mirror = false,
              prompt_position = 'bottom',
              width = 150,
              height = 20,
            },
          },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ile [F]ind' })
    vim.keymap.set('n', '<leader>sht', builtin.help_tags, { desc = '[S]earch [H]elp [T]ags' })
    vim.keymap.set('n', '<leader>shh', builtin.highlights, { desc = '[S]earch [H]elp [H]ighlight' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>ssd', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbols [D]ocument' })
    vim.keymap.set('n', '<leader>ssw', builtin.lsp_dynamic_workspace_symbols, { desc = '[S]earch [S]ymbols [W]orkspace' })
    vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch [T]elescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Search Current Buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
