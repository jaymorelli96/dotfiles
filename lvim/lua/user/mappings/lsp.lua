local kind = require('user.mappings.kind')
lvim.lsp.buffer_mappings.normal_mode['gk'] = lvim.lsp.buffer_mappings.normal_mode['K']

lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
  kind.cmp_kind.Reference .. " Find references"
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  ":lua vim.lsp.buf.definition()<cr>",
  -- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
  kind.cmp_kind.Reference .. " Definitions"
}

lvim.lsp.buffer_mappings.normal_mode["gD"] = {
  ":lua vim.lsp.buf.type_definition()<cr>",
  kind.cmp_kind.Reference .. " Type Definition"
}

lvim.lsp.buffer_mappings.normal_mode["gf"] = {
  ":Telescope frecency<cr>",
  kind.cmp_kind.Reference .. " Telescope Frecency"
}

lvim.lsp.buffer_mappings.normal_mode["ga"] = {
  ":lua vim.lsp.buf.code_action()<cr>",
  kind.cmp_kind.Reference .. " Find references"
}
