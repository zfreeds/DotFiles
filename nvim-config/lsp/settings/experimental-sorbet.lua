
---@brief
---
--- https://sorbet.org
---
--- Sorbet is a fast, powerful type checker designed for Ruby.
---
--- You can install Sorbet via gem install. You might also be interested in how to set
--- Sorbet up for new projects: https://sorbet.org/docs/adopting.
---
--- ```sh
--- gem install sorbet
--- ```
return {
  -- cmd = { 'bazel-bin/main/sorbet', '--lsp', '--wait-for-dbg', '.' },
	cmd = {'/Users/zackfreedman/Projects/sorbet/bazel-bin/main/sorbet', '--lsp', '--silence-dev-message', '--disable-watchman', '.'},
	-- cmd = { 'srb', 'tc', '--lsp' },
	filetypes = { 'ruby' },
	root_dir = function(fname)
		return require('lspconfig.util').root_pattern('Gemfile', '.git')(fname)
	end,
}
