" =====================
"  Vim - configuración
" =====================

" [Plugins]

call plug#begin('~/.vim/plugged')

" Generales
Plug 'noahfrederick/vim-noctu'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Escritura
Plug 'lervag/wiki.vim'
Plug 'AstralCam/quicktex'
Plug 'lervag/vimtex'
Plug 'dbridges/vim-markdown-runner'
Plug 'samgriesemer/vim-roam-md'

" Opcionales
Plug 'arcticicestudio/nord-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

" [Opciones generales]

set nocompatible
set foldmethod=indent
set foldnestmax=2
set nofoldenable
set undolevels=1000
set path=**
set hidden
set wildmenu
set ignorecase

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

nnoremap <Leader><Leader>   :CtrlPMixed<CR>
nnoremap <silent> <C-j>     :bn<CR>
nnoremap <silent> <C-k>     :bp<CR>

nnoremap <Leader>r :MarkdownRunner<CR>
nnoremap <Leader>R :MarkdownRunnerInsert<CR>

set termguicolors
colorscheme nord

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
let g:wiki_link_toggle_on_follow = 0

set spelllang=es
" set spell
" hi clear SpellBad
" hi SpellBad cterm=underline
" hi Conceal ctermbg=NONE

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap ;; ñ
inoremap [[ [[
inoremap [a á
inoremap [e é
inoremap [i í
inoremap [o ó
inoremap [u ú
