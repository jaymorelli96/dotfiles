local wk = lvim.builtin.which_key


wk.mappings["m"] = { "<cmd>Telescope marks<cr>", "Markers" }
wk.mappings["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" }

wk.mappings["n"] = {
  name = "Noice",
  d = { "<cmd>Noice dismiss<cr>", "Dismiss" },
  e = { "<cmd>NoiceErrors<cr>", "Errors" },
}

wk.mappings["o"] = {
  name = "Go",
  e = { "<cmd>GoIfErr<cr>", "If Error" },
  r = { "<cmd>GoRename<cr>", "Rename" },
}

wk.mappings["t"] = {
  name = "Trouble/Todo",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  c = { "<cmd>TodoTelescope <cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
}

wk.mappings["v"] = { "<cmd>Telescope neoclip<cr>", "Neoclip" }
wk.mappings["d"] = { '"_dd', "Delete VOID" }
wk.mappings["p"] = { '""p', "Paste from normal register" }
wk.vmappings["p"] = { '""p', "Paste from normal register" }
wk.vmappings["d"] = { '"_d', "Delete VOID" }

wk.mappings["S"] = {
  name = "Persistence",
  s = { "<cmd>lua require('persistence').load()<cr>", "Reload last session for dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

wk.mappings["s"]["w"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  "Search Word Under Cursor"
}

wk.mappings["W"] = {
  name = "Window Ctrl",
  h = { '<C-w>|', ' Maximize window horizontally (|)' },
  v = { '<C-w>_', ' Maximize window vertically (_)' },
  ['='] = { '<C-w>=', ' Resize windows equally' },
  s = { ":lua require('telescope-tabs').list_tabs()<cr>", ' Search Tabs' },
}
