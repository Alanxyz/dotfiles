" =====================
"  Vim - configuración
" =====================

" [Plugins]

let g:polyglot_disabled = ['markdown']
call plug#begin('~/.vim/plugged')

" Generales
Plug 'noahfrederick/vim-noctu'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'sheerun/vim-polyglot'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'

" Escritura
Plug 'junegunn/goyo.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/wiki.vim'
Plug 'samgriesemer/vim-roam-md'
Plug 'dkarter/bullets.vim'
Plug 'LukeSmithxyz/vimling'

" Opcionales
Plug 'tomasiser/vim-code-dark'
Plug 'godlygeek/tabular'

call plug#end()

" [Opciones generales]

set nocompatible
set foldmethod=indent foldnestmax=2 nofoldenable
set undolevels=1000
set path=**
set hidden
set wildmenu
set ignorecase
set updatetime=300 shortmess+=c
set wrap linebreak
set expandtab softtabstop=2 shiftwidth=2 smarttab
set autoindent
set encoding=utf-8
set nobackup nowritebackup noswapfile

nnoremap Q          @q
nnoremap <Leader>r  <CMD>source ~/.vimrc<CR>
nnoremap <Leader>v  <CMD>edit ~/.vimrc<CR>

" [Navegación]

nnoremap <Leader><Leader> <CMD>FZF<CR>
nnoremap <silent> <C-j>   <CMD>bn<CR>
nnoremap <silent> <C-k>   <CMD>bp<CR>
nnoremap <Leader>e        <CMD>NERDTreeToggle<CR>

" [Apariencia]

set background=dark
" set termguicolors
colorscheme dim

set foldtext='...'
set fillchars=fold:\ 
hi Folded guibg=NONE

set conceallevel=0


" [Documentos]

let g:vim_markdown_math          = 1
let g:vim_markdown_frontmatter   = 1
let g:wiki_root                  = '~/Documents/Notes'
let g:wiki_filetypes             = ['md']
let g:wiki_link_toggle_on_follow = 0
let g:wiki_journal               = { 'name': '' }
let g:bullets_enabled_file_types = ['markdown']
let g:bullets_outline_levels     = ['std*']

nnoremap <Leader>s <CMD>set spell!<CR>
nnoremap <Leader>c <CMD>set conceallevel=2<CR>
nnoremap <Leader>C <CMD>set conceallevel=0<CR>
nnoremap <Leader>g <CMD>Goyo<CR>
nnoremap <Leader>t <CMD>TableFormat<CR>

hi mkdDelimiter cterm=bold
hi mkdH1 cterm=bold
hi mkdH2 cterm=bold
hi mkdH3 cterm=bold
hi mkdH4 cterm=bold
hi mkdDelimiter ctermfg=Grey

" [Escritura]

set spelllang=es

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap [[ [[<C-x><C-o><C-p>

inorea DATE <C-R>=strftime('%Y-%m-%d')<CR>
inorea NOW <C-R>=strftime('%Y-%m-%d %H:%M')<CR>

let g:latex_to_unicode_file_types = ['markdown']
let g:SuperTabDefaultCompletionType = '<c-n>'
