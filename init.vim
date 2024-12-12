set runtimepath^=~/.vim runtimepath^=~/.config/nvim/lua runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require("user/autopair")
lua require("user/bufferline")
lua require("user/comment")
lua require("user/indent")
lua require("user/lsp")
lua require("user/lualine")
lua require("user/luasnip")
lua require("user/fzf")
lua require("user/toggleterm")
lua require("user/treesitter")
lua require("user/whichkey")
lua require("user/auto-session")

lua require("mason").setup()
