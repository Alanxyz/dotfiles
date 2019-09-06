" ===================
" Vim - configuracion
" ===================

" 1) Plugins
" 2) Opciones de Vim
" 3) Opciones visuales
" 4) Autocompletado
" 5) Atajos de teclado

" 1 --------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
  Plug 'NLKNguyen/papercolor-theme'       " Esquema de color
  Plug 'mileszs/ack.vim'                  " Buscador avanzado
  Plug 'scrooloose/nerdtree'              " Arbol de directorios
  Plug 'Yggdroot/indentLine'              " Lineas guia para alineacion
  Plug 'tpope/vim-fugitive'               " Git desde Vim
  Plug 'airblade/vim-gitgutter'           " Cambios con git
  Plug 'sheerun/vim-polyglot'             " Lenguajes extra
  Plug 'mattn/emmet-vim'                  " Abreviaturas XML
  Plug 'jiangmiao/auto-pairs'             " Cerrado de llaves, parentecis...
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

" 3 --------------------------------------------------------------------------

set termguicolors
set bg=dark
color PaperColor
hi Normal guibg=#000000 ctermbg=NONE
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" 4 --------------------------------------------------------------------------

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

" 5 --------------------------------------------------------------------------

imap     ñ          <Esc>
vmap     ñ          <Esc>
nnoremap ,          :Ack!<Space>
inoremap <Tab>      <C-R>=Tab_Or_Complete()<CR>
nnoremap <Tab>      :bn<CR>
nnoremap <S-Tab>    :bp<CR>
imap     <S-Tab>    <C-y>,
nnoremap <F2>       :NERDTreeFocus<CR>
nnoremap <F5>       :read !python3 % > /dev/null<CR>
nnoremap <F8>       :TagbarOpen<CR><C-w>l
