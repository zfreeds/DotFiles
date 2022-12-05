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
Plug 'airblade/vim-rooter'
Plug 'RRethy/vim-illuminate'
Plug 'moll/vim-bbye'

" NEOVIM ONLY
Plug 'akinsho/toggleterm.nvim', Cond(is_nvim)
Plug 'iamcco/markdown-preview.nvim', Cond(is_nvim, { 'do': 'cd app && yarn install' })
Plug 'lukas-reineke/indent-blankline.nvim', Cond(is_nvim)
Plug 'windwp/nvim-autopairs', Cond(is_nvim)
Plug 'numToStr/Comment.nvim', Cond(is_nvim)
	Plug'JoosepAlviste/nvim-ts-context-commentstring', Cond(is_nvim)
Plug 'kyazdani42/nvim-web-devicons', Cond(is_nvim)
	Plug 'nvim-lualine/lualine.nvim', Cond(is_nvim)
	Plug 'akinsho/bufferline.nvim', Cond(is_nvim)
Plug 'folke/which-key.nvim', Cond(is_nvim)
Plug 'ThePrimeagen/refactoring.nvim', Cond(is_nvim)
Plug 'goolord/alpha-nvim', Cond(is_nvim)

" cmp
Plug 'neovim/nvim-lspconfig', Cond(is_nvim)
Plug 'hrsh7th/cmp-nvim-lsp', Cond(is_nvim)
Plug 'hrsh7th/cmp-buffer', Cond(is_nvim)
Plug 'hrsh7th/cmp-path', Cond(is_nvim)
Plug 'hrsh7th/cmp-cmdline', Cond(is_nvim)
Plug 'hrsh7th/nvim-cmp', Cond(is_nvim)
Plug 'hrsh7th/cmp-nvim-lua'
	" For luasnip users.
	 Plug 'L3MON4D3/LuaSnip', Cond(is_nvim)
	 Plug 'saadparwaiz1/cmp_luasnip', Cond(is_nvim)
	 Plug 'rafamadriz/friendly-snippets', Cond(is_nvim)
"  LSP
Plug 'williamboman/mason.nvim', Cond(is_nvim) " simple to use language server installer
Plug 'williamboman/mason-lspconfig.nvim', Cond(is_nvim) " simple to use language server installer
	Plug 'jose-elias-alvarez/null-ls.nvim', Cond(is_nvim)

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', Cond(is_nvim, {'do': ':TSUpdate'})

" Telescope
Plug 'nvim-lua/plenary.nvim', Cond(is_nvim)
Plug 'nvim-telescope/telescope.nvim', Cond(is_nvim, { 'tag': '0.1.0' })
Plug 'elihunter173/dirbuf.nvim', Cond(is_nvim)
call plug#end()

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
