vim.cmd[[
colorscheme nord
]]

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.relativenumber = true


opt.foldcolumn = '0' -- '0' is not bad
opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

