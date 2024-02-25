return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		"nvim-telescope/telescope.nvim",
		"nvim-treesitter",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		dir = "/mnt/c/Users/z004t9es/notes",
		-- templates = {
		-- 	subdir = "Templates",
		-- 	date_format = "%d-%m-%Y-%a",
		-- 	time_format = "%H:%M",
		-- },
	},

}
