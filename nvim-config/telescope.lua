local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Couldn't load: telescope")
	return
end
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup{
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key",
				["<C-k>"] = lga_actions.quote_prompt(),
				-- freeze the current list and start a fuzzy search in the frozen list
				["<C-space>"] = lga_actions.to_fuzzy_refine,
			}
		}
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		git_files = {
			theme = "dropdown",
		}
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	}
}

telescope.load_extension("live_grep_args")
