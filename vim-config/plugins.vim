"""""""""" Plugins  """"""""""
" Vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
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
call plug#end()
