local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	print("Couldn't load: which-key")
	return
end

wk.setup({
	notify = false
})

local map = function(modes, key, cmd, opts)
  opts = opts or { noremap = true, silent = true }
  vim.keymap.set(modes, key, cmd, opts)
end

-- map("n", "<leader>n", " :NERDTreeFocus<CR>", {desc = ""})


-- map("n", "<leader>p", "<cmd>Telescope find_files hidden=true<cr>", {desc = "Find files"})
-- map("n", "<C-p>", "<cmd>Telescope find_files hidden=true<cr>", {desc = "Find files"})
map("n", "<leader>p", "<cmd>FzfLua files<cr>", {desc = "Find files"})
map("n", "<C-p>", "<cmd>FzfLua  files<cr>", {desc = "Find files"})
map("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", {desc = "Live grep"})
map("n", "<leader>:", "<cmd>FzfLua  commands<cr>", {desc = "Find helpful commands"})

wk.register({
  s = { name = "Search",
    m = { "<cmd>FzfLua  marks<cr>", "Marks" },
    g = { "<cmd>FzfLua  git_commits<cr>", "Git Commits" },
    h = { "<cmd>FzfLua  oldfiles<cr>", "Recent Files" },
    q = { "<cmd>FzfLua  quickfix<cr>", "Quickfix" },
    [":"] = { "<cmd>FzfLua  help_tags<cr>", "Vim Help Pages" },
  },
  f = { name = "Find",
	b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
    f = { "<cmd>FzfLua files<cr>", "Find Files" },
  },
}, { prefix = "<leader>" })


-- Fzf keymaps  -- might be helpful for finding common keymaps (e.g user defined)
-- Fzf changes -- might be useful to look for lines I changed

-- # GoTo
-- map("n", "<leader>gu", "<cmd>lua vim.lsp.buf.references()<CR>", {})
-- ]c and [c also work
map("n", "<leader>gC", ":GitGutterPrevHunk<cr>", {})
map("n", "<leader>gc", ":GitGutterNextHunk<cr>", {})

-- # Errors
map("n", "ge", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", {desc = "Next Error"})
map("n", "gE", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", {desc = "Prev Error"})
-- wk.register({
-- 	r = {
-- 		name = "Refactor",
-- 		e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
-- 		v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], "Extract Variable" },
-- 		i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
-- 	}
-- }, { prefix = "<leader>" , mode = "v"})



