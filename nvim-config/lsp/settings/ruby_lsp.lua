-- Bypass Mason's ruby-lsp binary — use the project's via shadowenv instead.
return {
	cmd = { "shadowenv", "exec", "--", "ruby-lsp" },
	init_options = {
		addonSettings = {
			["Ruby LSP Rails"] = {
				enablePendingMigrationsPrompt = false,
			},
		},
	},
}
