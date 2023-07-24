require("user.mappings.lsp")
require("user.mappings.whichkey")

-- TERMINAL
lvim.builtin.terminal.open_mapping = "<c-t>"

-- NORMAL MODE
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

lvim.keys.normal_mode["B"] = "0"
lvim.keys.normal_mode["E"] = "$"

lvim.keys.normal_mode["<Esc>"] = ":noh<CR>"
lvim.keys.normal_mode["<bs>"] = "<C-^>zz"

lvim.keys.normal_mode[";"] = ":"

lvim.keys.normal_mode["<C-p>"] = "%"

lvim.keys.normal_mode["cis"] = 'ci"'
lvim.keys.normal_mode["vis"] = 'vi"'

lvim.keys.normal_mode["K"] = false
lvim.keys.normal_mode["K"] = "<cmd>bnext<cr>"
lvim.keys.normal_mode["J"] = "<cmd>bprev<cr>"

lvim.keys.normal_mode["y"] = '"*y'
lvim.keys.normal_mode["Y"] = '"*Y'
lvim.keys.normal_mode["p"] = '"*p'
lvim.keys.normal_mode["P"] = '"*P'

lvim.keys.normal_mode["zR"] = ":lua require('ufo').openAllFolds()<CR>"
lvim.keys.normal_mode["zM"] = ":lua require('ufo').closeAllFolds()<CR>"

-- VISUAL MODE
lvim.keys.visual_mode["y"] = '"*y'
lvim.keys.visual_mode["Y"] = '"*Y'
lvim.keys.visual_mode["p"] = '"*p'
lvim.keys.visual_mode["P"] = '"*P'


-- INSERT MODE
lvim.keys.insert_mode["jk"] = "<Esc>"
