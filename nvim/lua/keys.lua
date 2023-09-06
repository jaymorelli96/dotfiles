vim.g.mapleader = " "

-- Silent keymap option
local opts = { silent = true }

local keymap = vim.keymap.set

-- CORE
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>c", ":bd!<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<Esc>", ":noh<CR>", opts)

keymap("i", "jk", "<Esc>")

keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- move lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- replace under cursor
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- PLUGINS
-- Neotree
keymap("n", "<leader>ee", ":Neotree toggle reveal<CR>")
keymap("n", "<leader>eb", ":Neotree toggle buffers<CR>")
keymap("n", "<leader>ec", ":Neotree close<CR>")

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fl", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fl", ":Telescope live_grep<CR>", opts)

-- undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- lazygit
keymap("n", "<leader>gg", ":LazyGit<CR>", opts)

-- worktree
keymap("n", "<leader>gt", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", opts)
