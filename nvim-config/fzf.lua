local fzf_lua = require('fzf-lua')

fzf_lua.setup{
	{"telescope"},
	-- fzf_opts = { -- todo look into this
	-- 	['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-history'
	-- }
	-- defaults = {
	-- 	formatter = "path.filename_first", -- Don't use this or else its harder to search
	-- },
	-- }
}
--
-- Command that allows searching for similar files
vim.api.nvim_create_user_command('FindSimilarFiles', function()
	-- https://vim.fandom.com/wiki/Get_the_name_of_the_current_file 
    local parent_dir = vim.fn.expand("%:p:h:t")
	local filename_root = vim.fn.expand("%:t:r")
	fzf_lua.files({query=parent_dir .. "/" .. filename_root})
end, {})

-- -- Configure lspfuzzy
-- -- FIXME - might not need this if I use Fzf-lua
-- require('lspfuzzy').setup {
--   methods = 'all',         -- either 'all' or a list of LSP methods (see below)
--   jump_one = true,         -- jump immediately if there is only one location
--   callback = nil,          -- callback called after jumping to a location
--   fzf_preview = {          -- arguments to the FZF '--preview-window' option
--     'right:+{2}-/2'          -- preview on the right and centered on entry
--   },
--   fzf_action = {           -- FZF actions
--     ['ctrl-t'] = 'tabedit',  -- go to location in a new tab
--     ['ctrl-v'] = 'vsplit',   -- go to location in a vertical split
--     ['ctrl-x'] = 'split',    -- go to location in a horizontal split
--   },
--   fzf_modifier = ':~:.',   -- format FZF entries, see |filename-modifiers|
--   fzf_trim = true,         -- trim FZF entries
-- }
