lvim.lsp.buffer_mappings.insert_mode["<C-s>"] = {
  "<cmd> lua vim.lsp.buf.signature_help()<cr>",
}

lvim.lsp.buffer_mappings.normal_mode['sd']    = {
  ":lua vim.lsp.buf.hover()<cr>",
}
lvim.lsp.buffer_mappings.normal_mode["K"]     = nil
lvim.lsp.buffer_mappings.normal_mode["gr"]    = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
}

lvim.lsp.buffer_mappings.normal_mode["se"]    = {
  ":lua vim.diagnostic.open_float()<cr>",
}

lvim.lsp.buffer_mappings.normal_mode["gd"]    = {
  ":lua vim.lsp.buf.definition()<cr>",
}

lvim.lsp.buffer_mappings.normal_mode["gD"]    = {
  ":lua vim.lsp.buf.type_definition()<cr>",
}

lvim.lsp.buffer_mappings.normal_mode["gi"]    = {
  ":lua require'telescope.builtin'.lsp_implementations()<cr>",
}

lvim.lsp.buffer_mappings.normal_mode["ga"]    = {
  ":lua vim.lsp.buf.code_action()<cr>",
}
