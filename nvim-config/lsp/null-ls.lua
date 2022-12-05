local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local lib = null_ls.builtins
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = lib.formatting
-- linter/diagnostics: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = lib.diagnostics
local hover = lib.hover
local code_actions = lib.code_actions

-- Use :NullLsInfo to find what's used

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.ktlint,
		-- formatting.stylua,
		hover.printenv,
		code_actions.refactoring
	},
})
