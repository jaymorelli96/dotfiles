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
	['<C-space>'] = cmp.mapping.complete(),

	-- Cycle through
	['<Tab>'] = cmp.mapping.select_next_item(cmp_select),

	-- Navigate between snippet placeholder
	['<C-n>'] = cmp_action.luasnip_jump_forward(),
	['<C-p>'] = cmp_action.luasnip_jump_backward(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	lsp.default_keymaps({
		buffer = bufnr,
		omit = { 'gs', 'K' },
	})

	vim.keymap.set("n", "J", ":m .+1<CR>==", opts)
	vim.keymap.set("n", "K", ":m .-2<CR>==", opts)

	vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end, opts)
	vim.keymap.set("n", "grr", function() require("telescope.builtin").lsp_references() end, opts)
	vim.keymap.set("n", "gi", function() require("telescope.builtin").lsp_implementations() end, opts)
	vim.keymap.set("n", "gq", function() require("telescope.builtin").quickfix() end, opts)
	vim.keymap.set("n", "gnd", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "gpd", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "gk", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "ge", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


require("lspconfig").ltex.setup {
	on_attach = function(client, bufnr)
		-- rest of your on_attach process.
		require("ltex_extra").setup {}
	end,
	settings = {
		ltex = {}
	}
}

lsp.setup()
