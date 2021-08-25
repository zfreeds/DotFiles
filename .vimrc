"To simlink, use full paths ln -s originalfile targetDir
" to get the original path call readlink thisFile
" To add plugins, add the plugin to ~/.vim/


" Vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
" Put plugins here
Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" End vim-plug


syntax on

set number

set relativenumber

set laststatus=2 " always show bottom bar

let mapleader = " "
let g:user_emmet_leader_key=','

set autoindent
set smartindent
set breakindent

imap jk <Esc>

set wrap linebreak
set ignorecase
filetype indent on

" Spell check
set spell
hi clear SpellBad
hi SpellBad cterm=underline
"hi SpellBad gui=undercurl

set tabstop=4
set shiftwidth=4


set path+=** "Search can now look in subfolders
set wildmenu "Display all matching files when we tab complete

:set iskeyword+=\- "Autcomplete completes hyphenated words
set clipboard=unnamedplus


" Scrolling
nmap <leader>d <C-d>
nmap <leader>u <C-u>
vmap <leader>d <C-d>
vmap <leader>u <C-u>

nmap <Leader>o :call GotoJump()<CR>
nnoremap <C-p> :GFiles<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
