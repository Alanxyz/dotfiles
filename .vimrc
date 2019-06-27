" ===================
" Vim - configuracion
" ===================

" 1) Plugins
" 2) Opciones de vim
" 3) Opciones visuales
" 4) Autocompletado inteligente
" 5) Definicion de atajos

" 1 --------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
  Plug 'mileszs/ack.vim'                  " Buscador avanzado
  Plug 'yuttie/hydrangea-vim'             " Tema para programar
  Plug 'yuttie/inkstained-vim'            " Tema para escribir
  Plug 'scrooloose/nerdtree'              " Arbol de directorios
  Plug 'Yggdroot/indentLine'              " Lineas guia para alineacion
  Plug 'ap/vim-buftabline'                " Barra de buffers
  Plug 'sheerun/vim-polyglot'             " Lenguajes extra
  Plug 'mattn/emmet-vim'                  " Abrevieturas html
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
set hidden
set nowrap
set showmatch
set noshowmode

" 3 --------------------------------------------------------------------------

set background=dark
set termguicolors
color hydrangea 

" 4 --------------------------------------------------------------------------

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

" 5 --------------------------------------------------------------------------

inoremap <Tab>      <C-R>=Tab_Or_Complete()<CR>
nnoremap ,          :Ack!<Space>
nnoremap <Tab>      :bn<CR>
nnoremap <S-Tab>    :bp<CR>
imap     <S-Tab>    <C-y>,
nnoremap <F2>       :NERDTreeToggle<CR>
nnoremap <F8>       :TagbarOpen<CR><C-w>l
