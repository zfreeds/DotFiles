local wk = require("which-key")


-- map("n", "<leader>n", " :NERDTreeFocus<CR>", {desc = ""})
local map = function(modes, key, cmd, opts)
  vim.keymap.set(modes, key, cmd, opts)
end


-- Find files using Telescope command-line sugar.
wk.add({ "<leader>f", group = "Find" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {desc = "Buffers"})

-- map("n", "<leader>p", "<cmd>Telescope find_files hidden=true<cr>", {desc = "Find files"})
-- map("n", "<C-p>", "<cmd>Telescope find_files hidden=true<cr>", {desc = "Find files"})
map("n", "<leader>p", "<cmd>Telescope git_files<cr>", {desc = "Find files"})
map("n", "<C-p>", "<cmd>Telescope git_files<cr>", {desc = "Find files"})
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", {desc = "Live grep"})
map("n", "<leader>:", "<cmd>Telescope commands<cr>", {desc = "Find helpful commands"})

wk.add({ "<leader>s", group = "Search" })
map("n", "<leader>sm", "<cmd>Telescope marks<cr>", {desc = "Marks"})
map("n", "<leader>sg", "<cmd>Telescope git_commits<cr>", {desc = "Git commits"})
map("n", "<leader>sh", "<cmd>Telescope oldfiles<cr>", {desc = "Recent Files"})


-- # GoTo
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
-- "nnoremap gp :action GoToSuperMethod<CR>
-- "nnoremap <leader>gt :action GotoTest<CR>
map("n", "<leader>gu", "<cmd>lua vim.lsp.buf.references()<CR>", {})
-- ]c and [c also work
map("n", "<leader>gC", ":GitGutterPrevHunk<cr>", {})
map("n", "<leader>gc", ":GitGutterNextHunk<cr>", {})

-- # Errors
map("n", "ge", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", {desc = "Next Error"})
map("n", "gE", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", {desc = "Prev Error"})
