"To simlink, use full paths ln -s originalfile targetDir
" to get the original path call readlink thisFile
" To add plugins, add the plugin to ~/.vim/

""""" Basics
let mapleader = "\<Space>"
let g:user_emmet_leader_key=','
imap jk <Esc>

""""" Navigating
" Scrolling
nmap <leader>d <C-d>
nmap <leader>u <C-u>
vmap <leader>d <C-d>
vmap <leader>u <C-u>

" Split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>

" Buffers
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

""""" Helpful add-ons
nnoremap L :bn<CR>
nnoremap H :bp<CR>

" Duplicate line
nmap yp "dyy"dp

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

" Toggle case and start typing. E.g. `<leader>iget`: `property` -> `getProperty`
map <leader>i ~hi

" Remove selection and toggle case. E.g. `v2l<leader>d`: `getProperty` -> `property`
vmap <leader>d d~h

""" Key modifications
" Prevent copying letters you cut
nnoremap x "_x
" Prevent copying letters you paste over
vnoremap p "_dP
" Copy end of line only
nnoremap Y yg$
" Allow navigating to files that don't exist
map gf :edit <cfile><cr>
" Center search results
nnoremap n nzzzv
nnoremap N Nzzzv

"""" Plugin bindings
" vim surround, use gs instead of ys
nmap gs ys

" Set current directory
nnoremap <leader>cd :cd %:p:h<CR>

" FZF
nnoremap <silent> <Leader>p :GFiles<CR>
"nnoremap <silent> <Leader>P  :Files %:h<CR>
nnoremap <silent> <Leader>P  :Files<CR>
nnoremap <silent> <Leader>/ :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
"nnoremap <silent> <Leader>/ :BLines<CR>


" Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Vim Wiki
nnoremap <leader>wk :VimwikiDiaryPrevDay<CR>
nnoremap <leader>wj :VimwikiDiaryNextDay<CR>

runtime! config/*.vim
