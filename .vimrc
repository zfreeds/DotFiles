"To simlink, use full paths ln -s originalfile targetDir
" to get the original path call readlink thisFile
" To add plugins, add the plugin to ~/.vim/


"""""""""" Plugins  """"""""""
" Vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
" Put plugins here
Plug 'tpope/vim-sensible'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'doums/darcula'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank' " Briefly highlight which text was yanked.
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-abolish' "Mostly used for changing case
Plug 'tpope/vim-repeat' " dot works as expected on plugins
Plug 'tpope/vim-fugitive' "Git
" * searches for visually selected pattern
Plug 'nelstrom/vim-visual-star-search'

call plug#end()

"""""""""" Color scheme """"""""""
colorscheme darcula
"set termguicolors  " (Only works with true color terms)
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'

"hi! link CocErrorSign ErrorSign
"hi! link CocWarningSign WarningSign
"hi! link CocInfoSign InfoSign
"hi! link CocHintSign HintSign
"hi! link CocErrorFloat Pmenu
"hi! link CocWarningFloat Pmenu
"hi! link CocInfoFloat Pmenu
"hi! link CocHintFloat Pmenu
"hi! link CocHighlightText IdentifierUnderCaret
"hi! link CocHighlightRead IdentifierUnderCaret
"hi! link CocHighlightWrite IdentifierUnderCaretWrite
"hi! link CocErrorHighlight CodeError
"hi! link CocWarningHighlight CodeWarning
"hi! link CocInfoHighlight CodeInfo
"hi! link CocHintHighlight CodeHint
"
"""""""""" NERD TREE """"""""""

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTreeMirror | NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <leader>n :NERDTreeFocus<CR>


let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"


" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>


"""""""""" Quick Config  """"""""""
" let g:coc_global_extensions = [
	" \ 'coc-snippets',
	" \ 'coc-pairs',
	" \ 'coc-html',
	" \ 'coc-json']
	"

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

set clipboard=unnamed
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
set splitright

set scrolloff=3 " Display at least 3 lines around you cursor
set visualbell
set noerrorbells


""""""""""  Mappings  """"""""""
let mapleader = "\<Space>"
let g:user_emmet_leader_key=','
imap jk <Esc>
" Scrolling
nmap <leader>d <C-d>
nmap <leader>u <C-u>
vmap <leader>d <C-d>
vmap <leader>u <C-u>

" nmap <Leader>o :call GotoJump()<CR>
nnoremap <C-p> :FZF<CR>

" Split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Prevent copying letters you cut
nnoremap x "_x
" Prevent copying letters you paste over
vnoremap p "_dP

" Copy end of line only
nnoremap Y yg$

" Center search results
nnoremap n nzzzv
nnoremap N Nzzzv

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Select line  https://vi.stackexchange.com/a/21238
xnoremap il g_o^
onoremap il :normal vil<CR>
xnoremap al $o^
onoremap al :normal V<CR>

" Alias replace all to S
nnoremap S :%s//g<Left><Left>

nnoremap <leader>sp  :.s/,/,\r/g<cr>

" vim surround, use gs instead of ys
nmap gs ys

nnoremap <leader>sp  :.s/,/,\r/g<cr>
"
" Allow navigating to files that don't exist
map gf :edit <cfile><cr>

" Toggle case and start typing. E.g. `<leader>iget`: `property` -> `getProperty`
map <leader>i ~hi
" Remove selection and toggle case. E.g. `v2l<leader>d`: `getProperty` -> `property`
vmap <leader>d d~h

""""""""""  VimWiki  """"""""""
nnoremap <leader>wk :VimwikiDiaryPrevDay<CR>
nnoremap <leader>wj :VimwikiDiaryNextDay<CR>

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

augroup customVimWiki | au!
	autocmd BufNewFile ~/vimwiki/diary/*.md
				\ exe ".!date" |
				\ exe  ":normal i# " |
				\ exe ":normal 4whr\ro" |
				set nomodified
augroup end

""""""" GOYO and Limelight """""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:limelight_conceal_ctermfg = 'DarkGray'
let g:limelight_paragraph_span = 1
let g:goyo_linenr = 1

""""""""""  Misc  """"""""""
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
