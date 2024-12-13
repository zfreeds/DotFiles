"To simlink, use full paths ln -s originalfile targetDir
" to get the original path call readlink thisFile
" To add plugins, add the plugin to ~/.vim/

""""" Basics
let mapleader = "\<Space>"
" let g:user_emmet_leader_key=','
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

" Buffers Navigation
nnoremap L :bn<CR>
nnoremap H :bp<CR>
nnoremap <leader>x :Bd<CR>

" Navigating within a buffer
"nnoremap [[ :action MethodUp<CR>
"nnoremap ]] :action MethodDown<CR>


"" Refactoring

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

""""  Bindings from back when I used Ideavim

"nnoremap <leader>rs :action ChangeSignature<CR>
"vmap <leader>rs :action ChangeSignature<CR>
"
"nnoremap <leader>ri :lua InlineVar()
"vmap <leader>ri :action Inline<CR>
"
"nnoremap <leader>rv :action IntroduceVariable<CR>
"vmap <leader>rv :action IntroduceVariable<CR>
"
"nnoremap <leader>rc :action IntroduceConstant<CR>
"vmap <leader>rc :action IntroduceConstant<CR>
"
"vmap <leader>rp :action IntroduceParameter<CR>
"nnoremap <leader>rp :action IntroduceParameter<CR>
"
"nnoremap <leader>rf :action RenameFile<CR>
"vmap <leader>rf :action RenameFile<CR>
"
"nnoremap <leader>rm :action ExtractMethod<CR>
"vmap <leader>rm :action ExtractMethod<CR>

"nnoremap <leader>rr <cmd>lua vim.lsp.buf.code_action()<CR>

"nnoremap gp :action GoToSuperMethod<CR>
"nnoremap <leader>gt :action GotoTest<CR>

" Test and Run
"nnoremap <leader>tt :action RunClass<CR>
"nnoremap <leader>tf :action RerunFailedTests<CR>


" ]c and [c also work
nnoremap <leader>gC :GitGutterPrevHunk<cr>
nnoremap <leader>gc :GitGutterNextHunk<cr>


" vim surround, use gs instead of ys
nmap gs ys

" Set current directory
nnoremap <leader>cd :cd %:p:h<CR>


" Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

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

runtime! config/*.vim


" Don't clear the screen after tests finish
let g:test#preserve_screen = 1


let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <C-j>  :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <C-k>  :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <C-l>  :<C-U>TmuxNavigateRight<cr>
