local lsp = require('lsp-zero').preset("recommended")

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())



-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
	-- `Enter` key to confirm completion
	['<CR>'] = cmp.mapping.confirm({ select = false }),

	-- Tab to trigger completion menu
	['<Tab>'] = cmp.mapping.complete(),

	-- Cycle through
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),

	-- Navigate between snippet placeholder
	['<C-f>'] = cmp_action.luasnip_jump_forward(),
	['<C-b>'] = cmp_action.luasnip_jump_backward(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "grr", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gk", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "ge", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()
