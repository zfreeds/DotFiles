"""""""""" Color scheme """"""""""
colorscheme darcula
set termguicolors  " (Only works with true color terms)
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'


""""""" GOYO and Limelight """""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:limelight_paragraph_span = 1
