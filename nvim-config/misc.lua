-- Save sessions unless in suppressed projects
vim.o.sessionoptions="blank,buffers,curdir,help,tabpages,winsize,winpos,terminal"
require("auto-session").setup {
	suppressed_dirs = { "~/", "~/Projects", "/"},
	purge_after_minutes = 20160, -- 2 weeks
	lsp_stop_on_restore = true,
}


-- indent_blankline plugin - Adds line indicators
require("ibl").setup { }


-- Edit project structure
require("oil").setup {
	delete_to_trash = true,
	-- skip_confirm_for_simple_edits = false,
	watch_for_changes = true,
	keymaps = {
		-- Disable keys I use for navigating panes like C-l
		["<C-l>"] = false,
		["<C-h>"] = false,
	},
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = true,
	}
}

-- Show helpful lines when scrolling down
require 'treesitter-context'.setup {
	max_lines = 5,
	line_numbers = false
}

vim.g.rooter_patterns = { 'Gemfile', '.git', 'Makefile', '*.sln', 'build/env.sh', 'dev.yml' }

-- splitjoin - gS to split, gJ to join
vim.g.splitjoin_trailing_comma = 1
vim.g.splitjoin_ruby_hanging_args = 0
vim.g.splitjoin_ruby_curly_braces = 0
vim.g.splitjoin_ruby_options_as_arguments = 1
