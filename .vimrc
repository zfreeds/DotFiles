"To simlink, use full paths ln -s originalfile targetDir
" to get the original path call readlink thisFile
" To add plugins, add the plugin to ~/.vim/

syntax on

set number

set relativenumber

set laststatus=2 " always show bottom bar

let g:user_emmet_leader_key=','

set autoindent
set smartindent
set breakindent

imap jk <Esc>

set wrap linebreak
set ignorecase

" Spell check
set spell
hi clear SpellBad
hi SpellBad cterm=underline
"hi SpellBad gui=undercurl
