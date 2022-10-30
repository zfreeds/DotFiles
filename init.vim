set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require("mason").setup()
lua require("user/cmp")
lua require("user/indent")
lua require("user/lsp")
lua require("user/telescope")
lua require("user/toggleterm")
lua require("user/treesitter")
lua require("user/autopair")
