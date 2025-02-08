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
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'nelstrom/vim-visual-star-search' " * searches for visually selected pattern
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish' "Mostly used for changing case
Plug 'tpope/vim-fugitive' "Git
Plug 'tpope/vim-rhubarb' " Allows visiting Github URLs
Plug 'tpope/vim-repeat' " dot works as expected on plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-rooter'
Plug 'RRethy/vim-illuminate'
Plug 'moll/vim-bbye'
Plug 'janko/vim-test'
Plug 'tpope/vim-projectionist' " Jump to test file
Plug 'itchyny/vim-qfedit' " Modifiable quickfix lists

" NEOVIM ONLY
Plug 'akinsho/toggleterm.nvim', Cond(is_nvim)
Plug 'lukas-reineke/indent-blankline.nvim', Cond(is_nvim)
Plug 'windwp/nvim-autopairs', Cond(is_nvim)
Plug 'numToStr/Comment.nvim', Cond(is_nvim, {'commit':'97a188a98b5a3a6f9b1b850799ac078faa17ab67'})
	Plug'JoosepAlviste/nvim-ts-context-commentstring', Cond(is_nvim, {'commit' : '4d3a68c41a53add8804f471fcc49bb398fe8de08' })
Plug 'kyazdani42/nvim-web-devicons', Cond(is_nvim)
	Plug 'nvim-lualine/lualine.nvim', Cond(is_nvim)
	Plug 'akinsho/bufferline.nvim', Cond(is_nvim)
Plug 'folke/which-key.nvim', Cond(is_nvim)
" Plug 'goolord/alpha-nvim', Cond(is_nvim)
Plug 'rmagatti/auto-session', Cond(is_nvim)

" LSP Related
Plug 'ThePrimeagen/refactoring.nvim', Cond(is_nvim)
Plug 'nvim-lua/plenary.nvim', Cond(is_nvim)
Plug 'VonHeikemen/lsp-zero.nvim', Cond(is_nvim, {'branch': 'v4.x'}) " Easier lsp config
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
	" Plug 'jose-elias-alvarez/null-ls.nvim', Cond(is_nvim)

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', Cond(is_nvim, {'do': ':TSUpdate'})
Plug 'nvim-treesitter/nvim-treesitter-textobjects', Cond(is_nvim)
Plug 'RRethy/nvim-treesitter-endwise', Cond(is_nvim)
Plug 'nvim-treesitter/nvim-treesitter-context', Cond(is_nvim)


Plug 'junegunn/fzf', Cond(is_nvim, { 'do': { -> fzf#install() } })
Plug 'ibhagwan/fzf-lua', Cond(is_nvim, {'branch': 'main'})
Plug 'ojroques/nvim-lspfuzzy', Cond(is_nvim) "        -- LSP Results use FZF
" optional for icon support
Plug 'nvim-tree/nvim-web-devicons', Cond(is_nvim)

Plug 'stevearc/oil.nvim', Cond(is_nvim)
Plug 'christoomey/vim-tmux-navigator', Cond(is_nvim)
Plug 'j-hui/fidget.nvim', Cond(is_nvim)

" Ruby
if executable('shadowenv') == 1
	Plug 'Shopify/shadowenv.vim'
endif
Plug 'tpope/vim-rails'
Plug 'noprompt/vim-yardoc'
Plug('tpope/vim-bundler')
call plug#end()

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
