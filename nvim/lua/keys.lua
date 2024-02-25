local wk = require("which-key")

wk.register({
	o = {
		name = "Obsidian", -- optional group name
		t = { "<cmd>lua require('obsidian').util.toggle_checkbox()<cr>", "Find File" },
	}
}, { prefix = "<leader>" })

-- Silent keymap option
local opts = { silent = true }

local keymap = vim.keymap.set
-- CORE
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>c", ":bd!<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<Esc>", ":noh<CR>", opts)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

keymap("i", "jk", "<Esc>", opts)

keymap("n", "G", "Gzz", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "cis", 'ci"', opts)
keymap("n", "cts", 'ct"', opts)

keymap("n", "<C-p>", "%", opts)

keymap("n", "<C-a>", "gg<S-v>G", opts)

keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- replace under cursor
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- PLUGINS
-- neotree
keymap("n", "<leader>ef", ":Neotree toggle reveal<CR>", opts)
keymap("n", "<leader>eb", ":Neotree toggle buffers<CR>", opts)
keymap("n", "<leader>eg", ":Neotree toggle git_status<CR>", opts)
keymap("n", "<leader>ec", ":Neotree close<CR>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fl", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fl", ":Telescope live_grep<CR>", opts)

-- undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- git
keymap("n", "<leader>gg", ":LazyGit<CR>", opts)
keymap("n", "<leader>gt", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gN", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)

-- comment
keymap("v", "<leader>/", "<leader>/", opts)

-- persistence
keymap("n", "<leader>S", [[<cmd>lua require("persistence").load({ last = true })<cr>]], opts)

-- trouble
keymap("n", "<leader>tt", ":Trouble workspace_diagnostics<cr>", opts)


keymap("n", "<leader>m", ":lua vim.lsp.semantic_tokens.get_at_pos()", opts)

-- illuminate
keymap("n", "<leader>n", ":lua require('illuminate').goto_next_reference(wrap)<cr>", opts)
keymap("n", "<leader>N", ":lua require('illuminate').goto_prev_reference(wrap)<cr>", opts)

-- frecency
keymap("n", "<leader><leader>", ":Telescope frecency<cr>", opts)

-- spell
function ToggleSpell()
	if vim.o.spell then
		vim.o.spell = false
		print("Spell checking disabled")
	else
		vim.o.spell = true
		print("Spell checking enabled")
	end
end

keymap("n", "<Leader>ts", ':lua ToggleSpell()<CR>', { noremap = true, silent = true })
