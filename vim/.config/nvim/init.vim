" =====================
"  Vim - configuracion
" =====================

" [Plugins]

call plug#begin('~/.vim/plugged')
  Plug 'jeffkreeftmeijer/vim-dim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'sheerun/vim-polyglot'
  Plug 'codota/tabnine-vim'
	Plug 'junegunn/goyo.vim'
call plug#end()

" [Opciones de Vim]

set foldmethod=indent
set foldnestmax=2
set nofoldenable
set undolevels=1000
set path=**
set wildignore+=**/node_modules/** 
set hidden
set number
set wildmenu

set autoindent
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set nobackup
set nowritebackup
set noswapfile

set updatetime=300
set shortmess+=c

" [Opciones visuales]

colorscheme dim

" [Manejo de archivos]

nnoremap <silent> <Tab>      :bn<CR>
nnoremap <silent> <S-Tab>    :bp<CR>
