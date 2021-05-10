" =====================
"  Vim - configuracion
" =====================

" [Plugins]

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'codota/tabnine-vim'
  Plug 'arzg/vim-colors-xcode'
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

set bg=light
colorscheme xcodelight

let g:rehash256 = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1

" [Manejo de archivos]

nnoremap <silent> <Tab>      :bn<CR>
nnoremap <silent> <S-Tab>    :bp<CR>
