local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	 print("failed on treesitter")
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,
		disable = { "" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	endwise = {
        enable = true,
    },
	indent = { enable = true, disable = { "python" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = false,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["ib"] = { query = "@block.inner"},
				["ab"] = { query = "@block.outer"},
			},
			selection_modes = {
				['@function.outer'] = 'V', -- linewise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			include_surrounding_whitespace = false,
		},
	}
})

