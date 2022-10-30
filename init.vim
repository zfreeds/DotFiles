set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require("user/toggleterm")
lua require("user/cmp")
lua require("user/lsp")
lua require("mason").setup()
