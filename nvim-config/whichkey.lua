local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	print("Couldn't load: which-key")
	return
end
local fzf_lua = require('fzf-lua')

-- TODO - create a float that can edit this on a per-project basis and save it
-- Alternatively, see if there's a lua file you can change per project
local file_ignore_patterns = {
	"%.rbi$",
	"./log",
	"public",
	"tmp",
	"vendor",
	"sorbet"

}
wk.setup({ notify = false })

local map = function(modes, key, cmd, opts)
  opts = opts or { noremap = true, silent = true }
  vim.keymap.set(modes, key, cmd, opts)
end

local function find_files()
	fzf_lua.files({file_ignore_patterns = file_ignore_patterns})
end

-- I keep thinking `BufOnly` is the name of the command
vim.api.nvim_create_user_command('BufOnly', 'BufferLineCloseOthers', {})


map("n", "<leader>p", find_files, {desc = "Find files"})
map("n", "<C-p>", find_files, {desc = "Find files"})
map("n", "<leader>/", function()fzf_lua.live_grep_glob({file_ignore_patterns = file_ignore_patterns})end, {desc = "Grep"})
map("n", "<leader>:", fzf_lua.commands, {desc = "Find helpful commands"})

wk.register({
  s = { name = "Search",
    m = { fzf_lua.marks, "Marks" },
    g = { fzf_lua.git_bcommits, "Git Buffer Commits" },
    h = { fzf_lua.oldfiles, "Recent Files" },
    q = { fzf_lua.quickfix, "Quickfix" },
    [":"] = { fzf_lua.help_tags, "Vim Help Pages" },
	s = { fzf_lua.lsp_live_workspace_symbols, "Symbols/Classes" },
	r = { fzf_lua.resume, "Resume" }

  },
  f = { name = "Find",
	b = { fzf_lua.buffers, "Buffers" },
    f = { find_files, "Find Files" },
    s = { "<cmd>FindSimilarFiles<cr>", "Find Similar Files" },
  },
}, { prefix = "<leader>" })


-- Fzf keymaps  -- might be helpful for finding common keymaps (e.g user defined)
-- Fzf changes -- might be useful to look for lines I changed

-- # GoTo
-- ]c and [c also work
map("n", "<leader>gC", ":GitGutterPrevHunk<cr>", {})
map("n", "<leader>gc", ":GitGutterNextHunk<cr>", {})

-- # Errors
map("n", "ge", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", {desc = "Next Error"})
map("n", "gE", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", {desc = "Prev Error"})



-- Vim Test
map("n", "<leader>tn", ":TestNearest<CR>", { silent = true })
map("n", "<leader>tf", ":TestFile<CR>", { silent = true })
map("n", "<leader>ts", ":TestSuite<CR>", { silent = true })
map("n", "<leader>tl", ":TestLast<CR>", { silent = true })
-- map('n', '<leader>tg', ':TestVisit<CR>', { silent = true })
vim.g['test#strategy'] = "toggleterm"
vim.g.dispatch_tmux_pipe_pane = 1  -- needed so $stdout.tty? is true and reline works when debugging
