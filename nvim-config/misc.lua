-- Save sessions unless in suppressed projects
require("auto-session").setup {
	suppressed_dirs = { "~/", "~/Projects", "/"},
}


-- indent_blankline plugin - Adds line indicators
require("ibl").setup { }


-- Show information about slow lsps
require("fidget").setup { }

-- Edit project structure
require("oil").setup {
	delete_to_trash = true,
	-- skip_confirm_for_simple_edits = false,
	watch_for_changes = true,

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

vim.g.rooter_patterns = { 'Gemfile', '.git', 'Makefile', '*.sln', 'build/env.sh' }
