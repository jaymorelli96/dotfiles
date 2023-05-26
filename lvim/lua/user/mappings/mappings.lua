require("user.mappings.lsp")
require("user.mappings.whichkey")

-- NORMAL MODE
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

lvim.keys.normal_mode["B"] = "0"
lvim.keys.normal_mode["E"] = "$"

lvim.keys.normal_mode["<Esc>"] = ":noh<CR>"
lvim.keys.normal_mode["<bs>"] = "<C-^>zz"

lvim.keys.normal_mode[";"] = ":"

lvim.keys.normal_mode["cis"] = 'ci"'
lvim.keys.normal_mode["vis"] = 'vi"'

-- INSERT MODE
lvim.keys.insert_mode["jk"] = "<Esc>"

-- HOP
lvim.keys.normal_mode["ss"] = "<cmd>HopChar2<cr>"
lvim.keys.normal_mode["sw"] = "<cmd>HopWord<cr>"
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
