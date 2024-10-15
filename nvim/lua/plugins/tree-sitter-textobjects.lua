return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            ['a='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
            ['i='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

            ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

            ['af'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
            ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

            ['am'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
            ['im'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },

            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next = {
            ['gnm'] = { query = '@function.outer', desc = '[G]o To [N]ext [M]ethod' },
            ['gns'] = { query = '@scope', query_group = 'locals', desc = '[G]o To [N]ext [S]cope' },
            ['gni'] = { query = '@coditional.outer', desc = '[G]o To [N]ext [I]f' },
            ['gnc'] = { query = '@class.outer', desc = '[G]o To [N]ext Struct/[C]lass' },
            ['gno'] = { query = '@loop.*', desc = '[G]o To [N]ext L[o]op' },
          },
          goto_previous = {
            ['gpm'] = { query = '@function.outer', desc = '[G]o To [P]revious [M]ethod' },
            ['gps'] = { query = '@scope', query_group = 'locals', desc = '[G]o To [P]revious [S]cope' },
            ['gpi'] = { query = '@coditional.outer', desc = '[G]o To [P]revious [I]f' },
            ['gpc'] = { query = '@class.outer', desc = '[G]o To [P]revious [S]truct/Class' },
            ['gpo'] = { query = '@loop.*', desc = '[G]o To [P]revious L[o]op' },
          },
        },
      },
    }
  end,
}
