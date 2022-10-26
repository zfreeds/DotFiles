"""""""""" Plugins  """"""""""
let is_vim = !has('nvim')
let is_nvim = has('nvim')
if is_nvim
    let $BASE = stdpath('config')
else
    let $BASE = '$HOME/.vim'
endif

" Lazy loading
" From https://github.com/junegunn/vim-plug/wiki/faq#conditional-activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


call plug#begin($BASE.'/plugged')
" Put plugins here
Plug 'PeterRincker/vim-argumentative'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'doums/darcula'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'machakann/vim-highlightedyank' " Briefly highlight which text was yanked.
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'nelstrom/vim-visual-star-search' " * searches for visually selected pattern
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish' "Mostly used for changing case
Plug 'tpope/vim-fugitive' "Git
Plug 'tpope/vim-repeat' " dot works as expected on plugins
Plug 'tpope/vim-surround' " dot works as expected on plugins
Plug 'tpope/vim-sensible'
Plug 'vimwiki/vimwiki'
Plug 'wellle/targets.vim'

Plug 'akinsho/toggleterm.nvim', Cond(is_nvim)
call plug#end()

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
