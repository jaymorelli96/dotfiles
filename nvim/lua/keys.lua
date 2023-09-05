vim.g.mapleader = " "

-- Silent keymap option
local opts = { silent = true }

local keymap = vim.keymap.set


-- NORMAL MODE
keymap("n", "<leader>e", vim.cmd.Ex)

keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fl", ":Telescope live_grep<CR>", opts)

-- INSERT MODE
keymap("i", "jk", "<Esc>")
