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
  Plug 'mileszs/ack.vim'                  " Buscador de codigo
  Plug 'ctrlpvim/ctrlp.vim'               " Buscador de archivos
  Plug 'scrooloose/nerdtree'              " Arbol de directorios
  Plug 'Yggdroot/indentLine'              " Lineas guia para alineacion
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
set wildignore+=node_modules

" 3 --------------------------------------------------------------------------

set bg=dark
colorscheme dim
hi Normal guibg=#000000 ctermbg=NONE
let g:rehash256 = 1
let g:indentLine_showFirstIndentLevel = 1
let NERDTreeMinimalUI = 1
let g:deoplete#enable_at_startup = 1

" 4 --------------------------------------------------------------------------

let g:ctrlp_map =   ',,'
let g:SuperTabDefaultCompletionType = '<C-n>'
imap     ñ          <Esc>
vmap     ñ          <Esc>
nnoremap <Tab>      :bn<CR>
nnoremap <S-Tab>    :bp<CR>
