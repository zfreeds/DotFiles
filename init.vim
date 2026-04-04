set runtimepath^=~/.vim runtimepath^=~/.config/nvim/lua runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Auto-start socket server so Claude Code can connect
let s:socket_dir = '/tmp/nvim-sockets'
if !isdirectory(s:socket_dir) | call mkdir(s:socket_dir, 'p') | endif
let s:socket = s:socket_dir . '/' . fnamemodify(getcwd(), ':t') . '-' . getpid()
if !filereadable(s:socket)
  call serverstart(s:socket)
endif

lua require("user/autopair")
lua require("user/bufferline")
lua require("user/comment")
lua require("user/lsp")
lua require("user/lualine")
lua require("user/luasnip")
lua require("user/fzf")
lua require("user/toggleterm")
lua require("user/treesitter")
lua require("user/whichkey")
lua require("user/misc")
lua require("user/ufo-fold")
lua require("user/dap")

lua require("mason").setup()
