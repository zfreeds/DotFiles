local status_ok, ts = pcall(require, "nvim-treesitter")
if not status_ok then
	print("failed on treesitter")
	return
end

-- TODO: change back to "all" once tree-sitter-cli is installed (brew install tree-sitter-cli or npm install -g tree-sitter-cli)
ts.install({ "ruby" })

local ts_augroup = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
	group = ts_augroup,
	pattern = '*',
	callback = function()
		if pcall(vim.treesitter.start) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

-- Textobjects
local ts_textobjects_ok, ts_textobjects = pcall(require, "nvim-treesitter-textobjects")
if ts_textobjects_ok then
	ts_textobjects.setup({
		select = {
			lookahead = false,
			selection_modes = {
				['@function.outer'] = 'V', -- linewise
			},
			include_surrounding_whitespace = false,
		},
	})

	local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
	local function tso(key, query)
		vim.keymap.set({ "x", "o" }, key, function() select_textobject(query, "textobjects") end)
	end
	tso("af", "@function.outer")
	tso("if", "@function.inner")
	tso("ac", "@class.outer")
	tso("ic", "@class.inner")
	tso("ib", "@block.inner")
	tso("ab", "@block.outer")
end

