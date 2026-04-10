local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	print("Couldn't load: which-key")
	return
end
local fzf_lua = require('fzf-lua')

wk.setup({ notify = false })

local map = function(modes, key, cmd, opts)
  opts = opts or { noremap = true, silent = true }
  vim.keymap.set(modes, key, cmd, opts)
end

local function find_files()
	fzf_lua.files({file_ignore_patterns = vim.g.fzf_file_ignore_patterns})
end

-- I keep thinking `BufOnly` is the name of the command
vim.api.nvim_create_user_command('BufOnly', 'BufferLineCloseOthers', {})


map("n", "<leader>p", find_files, {desc = "Find files"})
map("n", "<C-p>", find_files, {desc = "Find files"})
map("n", "<leader>/", function()fzf_lua.live_grep({file_ignore_patterns = vim.g.fzf_file_ignore_patterns})end, {desc = "Grep"})
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
  d = { name = "Debug",
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    n = { "<cmd>lua require'dap'.step_over()<cr>", "Next" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    f = { "<cmd>lua require'dap'.step_out()<cr>", "Finish (Step Out)" },
    r = { "<cmd>lua require'dap'.repl.open()<cr>", "REPL" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { "<cmd>lua require'dapui'.eval(nil, { enter = true })<cr>", "Eval Under Cursor" },
    w = { "<cmd>lua require'dapui'.elements.watches.add()<cr>", "Add Watch" },
    -- l = { function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log message: ')) end, "Logpoint" }, -- rdbg doesn't support logpoints
    -- x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" }, -- kills the server process, not just the debugger
  },
}, { prefix = "<leader>" })


-- Fzf keymaps  -- might be helpful for finding common keymaps (e.g user defined)
-- Fzf changes -- might be useful to look for lines I changed

-- # GoTo
-- ]c and [c also work
map("n", "<leader>gC", ":GitGutterPrevHunk<cr>", {})
map("n", "<leader>gc", ":GitGutterNextHunk<cr>", {})

-- # Errors
map("n", "ge", function()vim.diagnostic.jump({count=1, float=true}) end, {desc = "Next Error"})
map("n", "gE", function()vim.diagnostic.jump({count=-1, float=true}) end, {desc = "Prev Error"})



-- Vim Test
map("n", "<leader>tn", ":TestNearest<CR>", { silent = true })
map("n", "<leader>tf", ":TestFile<CR>", { silent = true })
map("n", "<leader>ts", ":TestSuite<CR>", { silent = true })
map("n", "<leader>tl", ":TestLast<CR>", { silent = true })
-- map('n', '<leader>tg', ':TestVisit<CR>', { silent = true })
vim.g['test#strategy'] = "toggleterm"
vim.g.dispatch_tmux_pipe_pane = 1  -- needed so $stdout.tty? is true and reline works when debugging



local function to_quickfix(visual)
  local lines
  if visual then
    local start = vim.fn.getpos("'<")[2]
    local finish = vim.fn.getpos("'>")[2]
    lines = vim.api.nvim_buf_get_lines(0, start - 1, finish, false)
  else
    lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  end
  vim.fn.setqflist({}, ' ', { lines = lines })
  vim.cmd('copen')
end

map("v", "<leader>tq", function() to_quickfix(true) end, { desc = "Send selection to quickfix" })
map("n", "<leader>tq", function() to_quickfix(false) end, { desc = "Send buffer to quickfix" })

map("n", "-", ":Oil<cr>", {desc = "Oil - edit file structure"})

vim.api.nvim_create_user_command(
	"CopyPath",
	":let @+=@%",
	{ desc = "Copy the current path to the clipboard"}
)
