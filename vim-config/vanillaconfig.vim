set number
set relativenumber
:hi CursorLine guifg=None
set timeoutlen=1000

set clipboard^=unnamed,unnamedplus
set wrap linebreak
set ignorecase
set smartcase

" Spell check
set spell
hi clear SpellBad
hi SpellBad cterm=underline

set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set breakindent

set nohlsearch
set path+=** "Search can now look in subfolders
:set iskeyword+=\- "Autcomplete completes hyphenated words
set mouse=a
set cursorline
set wildmode=longest,list,full
" Direction splits happen in
set splitbelow
set splitright

set scrolloff=3 " Display at least 3 lines around you cursor

set undofile
set undolevels=1000
set undoreload=10000

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

packadd cfilter
