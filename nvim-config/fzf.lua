local fzf_lua = require('fzf-lua')

fzf_lua.setup{
	{"telescope"},
	-- fzf_opts = { -- todo look into this
	-- 	['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-history'
	-- }
	-- defaults = {
	-- 	formatter = "path.filename_first", -- Don't use this or else its harder to search
	-- },
	winopts = {
		width = 0.9,
	},
	lsp = {
		includeDeclaration = false
	},
	fzf_opts = {
		["--layout"] = "reverse"
	}
}
--
-- Command that allows searching for similar files
vim.api.nvim_create_user_command('FindSimilarFiles', function()
	-- https://vim.fandom.com/wiki/Get_the_name_of_the_current_file 
    local parent_dir = vim.fn.expand("%:p:h:t")
	local filename_root = vim.fn.expand("%:t:r")
	fzf_lua.files({query=parent_dir .. "/" .. filename_root})
end, {})


-- TODO - create a float that can edit this on a per-project basis and save it
-- Alternatively, see if there's a lua file you can change per project
local default_file_ignore_patterns = {
	"%.rbi$",
	"./log",
	"public",
	"tmp",
	"vendor",
	"sorbet",
	-- Dotfiles repo
	"dotbot",
	"install"
}
vim.g.fzf_file_ignore_patterns = default_file_ignore_patterns

vim.api.nvim_create_user_command('ToggleIgnoreFiles', function()
	if (vim.deep_equal(vim.g.fzf_file_ignore_patterns,  default_file_ignore_patterns)) then
		vim.g.fzf_file_ignore_patterns = {}
	else
		vim.g.fzf_file_ignore_patterns = default_file_ignore_patterns
	end
	print(vim.inspect(vim.g.fzf_file_ignore_patterns))
end, {})
