local opt = vim.opt
local global = vim.g

-- Colorscheme
function ColorMyPencils(color)
	color = color or "nord"
	-- color = color or "catppuccin-latte"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

-- Editor
opt.relativenumber = true
opt.cursorline = true
opt.nu = true

opt.tabstop = 2    -- insert 2 spaces for a tab
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation

opt.guicursor = ""
opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.termguicolors = true

opt.scrolloff = 8

opt.updatetime = 50

opt.spelllang = "en_us"

opt.textwidth = 0
opt.wrapmargin = 0
opt.wrap = true
opt.linebreak = true
opt.columns = 120

-- Windows Clipboard win32yank Options
opt.clipboard = "unnamedplus"

-- UFO Options
opt.foldcolumn = '0'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- auto format
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- highlight groups
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "TelescopeResultBorder", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "TelescopeSelectionBorder", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#88C0D0" })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = "#88C0D0" })



-- AUTO CMDS
-- go auto format
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimport()
	end,
	group = format_sync_grp,
})
-- autosave
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.api.nvim_command('silent update')
		end
	end,
})

vim.api.nvim_create_augroup('bufcheck', { clear = true })
-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
	group    = 'bufcheck',
	pattern  = '*',
	callback = function() vim.highlight.on_yank { timeout = 100 } end
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = true
	end,
});


-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_filetypes = {
	["*"] = false,
	["javascript"] = true,
	["typescript"] = true,
	["lua"] = false,
	["rust"] = true,
	["c"] = true,
	["c#"] = true,
	["c++"] = true,
	["go"] = true,
	["python"] = true,
}
