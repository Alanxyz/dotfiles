" ===================
" Vim - configuracion
" ===================

" 1) Plugins
" 2) Opciones de Vim
" 3) Opciones visuales
" 4) Atajos de teclado

" 1 --------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
  Plug 'jeffkreeftmeijer/vim-dim'         " Esquema de color
  Plug 'tpope/vim-fugitive'               " Git desde Vim
  Plug 'airblade/vim-gitgutter'           " Cambios con git
  Plug 'sheerun/vim-polyglot'             " Lenguajes extra
  Plug 'mattn/emmet-vim'                  " Abreviaturas XML
  Plug 'jiangmiao/auto-pairs'             " Cerrado de llaves, parentecis...
  Plug 'Shougo/deoplete.nvim'             " Autocompletado inteligente {
  Plug 'ervandew/supertab'
  Plug 'roxma/nvim-yarp'                  
  Plug 'roxma/vim-hug-neovim-rpc'         " }
call plug#end()

" 2 --------------------------------------------------------------------------

set number
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set showmatch	
set hlsearch
set smartcase	
set ignorecase	
set incsearch	
set autoindent	
set cindent	
set expandtab
set shiftwidth=2
set smartindent	
set smarttab
set softtabstop=2
set ruler	
set foldmethod=indent
set foldnestmax=2
set nofoldenable
set undolevels=1000
set backspace=indent,eol,start
set noswapfile
set nobackup
set encoding=utf-8
set fileformat=unix
set hidden
set nowrap
set showmatch
set noshowmode
set path=**
set wildignore+=node_modules,__pycache__
set wildmenu

" 3 --------------------------------------------------------------------------

set bg=dark
colorscheme dim
hi Normal guibg=#000000 ctermbg=NONE
hi CursorLine       cterm=NONE ctermbg=black
hi GitGutterAdd     ctermfg=2
hi GitGutterDelete  ctermfg=1
hi GitGutterChange  ctermfg=3
let g:rehash256 = 1
let g:deoplete#enable_at_startup = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3

" 4 --------------------------------------------------------------------------

let g:SuperTabDefaultCompletionType = '<C-n>'
imap     ñ          <Esc>
vmap     ñ          <Esc>
nnoremap <Tab>      :bn<CR>
nnoremap <S-Tab>    :bp<CR>
