set runtimepath^=~/.vim runtimepath^=~/.config/nvim/lua runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require("user/autopair")
" lua require("user/bufferline")
" lua require("user/cmp")
lua require("user/comment")
" lua require("user/indent")
" lua require("user/lsp")
" lua require("user/lualine")
" lua require("user/luasnip")
" lua require("user/obsidian")
lua require("user/telescope")
lua require("user/toggleterm")
" lua require("user/treesitter")
lua require("user/whichkey")

" lua require("mason").setup()
