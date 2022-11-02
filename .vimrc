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

"""" Plugin bindings
"" LSP
" Refactorings
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
vnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>

"nnoremap <leader>rs :action ChangeSignature<CR>
"vmap <leader>rs :action ChangeSignature<CR>
"
"nnoremap <leader>ri :action Inline<CR>
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

nnoremap <leader>rr <cmd>lua vim.lsp.buf.code_action()<CR>
vnoremap <leader>rr <cmd>lua vim.lsp.buf.code_action()<CR>

" TODO consider if worth keeping
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>

" Formatting - todo consider better 
nnoremap <leader>lf<cmd>lua vim.lsp.buf.format{ async = true }<cr> 

" GoTo
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gI <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap gp :action GoToSuperMethod<CR>
"nnoremap <leader>gt :action GotoTest<CR>
nnoremap <leader>gu <cmd>lua vim.lsp.buf.references()<CR>
" ]c and [c also work
nnoremap <leader>gC :GitGutterPrevHunk<cr>
nnoremap <leader>gc :GitGutterNextHunk<cr>

"""" Errors
nnoremap ge <cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>
nnoremap gE <cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>
" Show error
nnoremap gl <cmd>lua vim.diagnostic.open_float()<cr>

"
" Test and Run
"nnoremap <leader>tt :action RunClass<CR>
"nnoremap <leader>tf :action RerunFailedTests<CR>

" vim surround, use gs instead of ys
nmap gs ys

" Set current directory
nnoremap <leader>cd :cd %:p:h<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>p <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>' <cmd>Telescope marks<cr>
nnoremap <leader>g <cmd>Telescope git_commits<cr>
nnoremap <leader>h <cmd>Telescope oldfiles<cr>

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
