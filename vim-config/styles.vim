"""""""""" Color scheme """"""""""
colorscheme darcula
set termguicolors  " (Only works with true color terms)
set background=dark

"""""""""" Fugitive Colors for Dark Theme """"""""""
" The '!' in highlight! forces the color to override any existing definition

" Diff backgrounds - subtle highlighting for changed regions
highlight! DiffAdd    guifg=NONE guibg=#1f3a1f gui=NONE
highlight! DiffDelete guifg=NONE guibg=#3a1f1f gui=NONE  
highlight! DiffChange guifg=NONE guibg=#1f2f3a gui=NONE
highlight! DiffText   guifg=NONE guibg=#2f3f4a gui=BOLD

" Git diff syntax colors (for +/- markers and content)
highlight! diffAdded   guifg=#89b482 guibg=#1f3a1f gui=NONE
highlight! diffRemoved guifg=#ea6962 guibg=#3a1f1f gui=NONE
highlight! diffChanged guifg=#7daea3 guibg=#1f2f3a gui=NONE
highlight! diffLine    guifg=#928374 guibg=NONE gui=BOLD

" Fugitive UI elements
highlight fugitiveHeader          guifg=#7daea3 gui=BOLD
highlight fugitiveHeading         guifg=#a9b665 gui=BOLD
highlight fugitiveUntrackedHeading guifg=#ea6962 gui=BOLD
highlight fugitiveUnstagedHeading  guifg=#e78a4e gui=BOLD
highlight fugitiveStagedHeading    guifg=#89b482 gui=BOLD
highlight fugitiveUntrackedSection guifg=#ea6962
highlight fugitiveUnstagedSection  guifg=#e78a4e
highlight fugitiveStagedSection    guifg=#89b482

" Fugitive blame view
highlight fugitiveBlameHash       guifg=#7daea3
highlight fugitiveBlameAnnotation guifg=#928374
highlight fugitiveBlameTime       guifg=#928374

"""""""""" GitGutter """"""""""
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'

""""""" GOYO and Limelight """""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_paragraph_span = 1
