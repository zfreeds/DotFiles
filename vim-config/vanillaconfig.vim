syntax on
set hidden
set nocompatible
set number
set relativenumber
set laststatus=2 " always show bottom bar

set directory^=$HOME/.vim/swap// " Set swp file location if exists. 

set autoindent
set smartindent
set breakindent

set clipboard^=unnamed,unnamedplus
set wrap linebreak
set ignorecase
set smartcase
filetype indent on
filetype plugin on

" Spell check
set spell
hi clear SpellBad
hi SpellBad cterm=underline

set tabstop=4
set shiftwidth=4

set path+=** "Search can now look in subfolders
set wildmenu "Display all matching files when we tab complete
:set iskeyword+=\- "Autcomplete completes hyphenated words
set mouse=a
set cursorline
set wildmode=longest,list,full
" Direction splits happen in
set splitbelow
set splitright

set scrolloff=3 " Display at least 3 lines around you cursor
set visualbell
set noerrorbells

augroup centering | au!
	" Center when entering insert mode
	autocmd InsertEnter * norm zz
augroup end


" Apply macros to each line in visual mode
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

augroup autosourcevimrc | au!
	" Auto source vimrc
	autocmd bufwritepost .vimrc source $MYVIMRC
augroup end