return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		pickers = {
			find_files = {
				hidden = true
			}
		}
	}
}
