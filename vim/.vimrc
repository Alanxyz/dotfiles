" =====================
"  Vim - configuracion
" =====================

" [Plugins]

call plug#begin('~/.vim/plugged')

" Genarales
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'

" Escritura
Plug 'lervag/wiki.vim'
Plug 'AstralCam/quicktex'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'

" Codigo
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'codota/tabnine-vim'

" Temas
" Plug 'arzg/vim-colors-xcode'
" Plug 'tomasiser/vim-code-dark'
" Plug 'beikome/cosme.vim'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

call plug#end()

" [Opciones generales]

set foldmethod=indent
set foldnestmax=2
set nofoldenable
set undolevels=1000
set path=**
set hidden
set number
set wildmenu

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab

set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile

set updatetime=300
set shortmess+=c

colorscheme nord

nnoremap <silent> <Tab>      :bn<CR>
nnoremap <silent> <S-Tab>    :bp<CR>

" [Opciones para codigo]

set wildignore+=**/node_modules/** 

" [Opciones para documentos]

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

set conceallevel=2
let g:tex_conceal='abdmg'
let g:vim_markdown_math = 1

let g:wiki_root = '~/Notas'
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'

" setlocal spell
set spelllang=es
hi clear SpellBad
hi SpellBad cterm=underline
hi Conceal ctermbg=NONE guibg=NONE
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap ;; ñ
inoremap 'a á
inoremap 'e é
inoremap 'i í
inoremap 'o ó
inoremap 'u ú
