local kind = require('user.mappings.kind')
local wk = lvim.builtin.which_key
local k = kind.cmp_kind
local i = kind.icons
local f = kind.file_icons

lvim.builtin.which_key.mappings["o"] = {
  name = " " .. f.LightBlue[1] .. " Go",
  a = { "<cmd>GoCodeAction<cr>", k.Text .. "Code Action" },
  e = { "<cmd>GoIfErr<cr>", i.exit .. "If Error" },
  r = { "<cmd>GoRename<cr>", k.Text .. "Rename" },
}


lvim.builtin.which_key.mappings["t"] = {
  name = "Trouble/Todo",
  r = { "<cmd>Trouble lsp_references<cr>", k.Reference .. "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", i.docs .. "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", i.config .. "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", k.Constructor .. "QuickFix" },
  c = { "<cmd>TodoTelescope <cr>", i.repo .. "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", k.EnumMember .. "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", i.config .. "Diagnostics" },
}


wk.mappings["S"] = {
  name = " persistence.nvim",
  s = { "<cmd>lua require('persistence').load()<cr>", kind.icons.clock .. " Reload last session for dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", kind.icons.clock .. " Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", kind.icons.exit .. " Quit without saving session" },
}

wk.mappings["s"]["w"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  ' ' .. kind.cmp_kind.EnumMember .. " Search Word Under Cursor"
}

wk.mappings["m"] = {
  name = ' ' .. kind.todo_comments.PERF .. " Harpoon",
  m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
  t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
  a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
  s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
  d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
  f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
  g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
  q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
  w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
  e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
  r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
}

wk.mappings["W"] = {
  name = ' ' .. kind.icons.screen .. " Window Ctrl",
  h = { '<C-w>|', 'Maximize window horizontally (|)' },
  v = { '<C-w>_', 'Maximize window vertically (_)' },
  ['='] = { '<C-w>=', 'Resize windows equally' },
  s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
}

wk.mappings['x'] = { ":xa<cr>", "Save All and Quit", }
