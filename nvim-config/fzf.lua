require('fzf-lua').setup{
	{"telescope"},
	files = {
		formatter = "path.filename_first",
	},
	git = {
		files = {
			formatter = "path.filename_first",
		}
	}
}
