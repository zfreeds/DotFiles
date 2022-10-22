let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTreeMirror | NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"
