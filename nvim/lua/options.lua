local opt = vim.opt

-- Colorscheme
function ColorMyPencils(color)
	color = color or "nord"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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

-- Windows Clipboard win32yank Options
-- opt.clipboard = "unnamedplus"

-- UFO Options
opt.foldcolumn = '0'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- auto format
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- go auto format
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimport()
	end,
	group = format_sync_grp,
})
