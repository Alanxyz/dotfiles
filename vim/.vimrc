" =====================
"  Vim - configuración
" =====================

" [Plugins]

let g:polyglot_disabled = ['markdown']
call plug#begin('~/.vim/plugged')

" Generales
Plug 'noahfrederick/vim-noctu'
Plug 'sheerun/vim-polyglot'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'

" Escritura
Plug 'junegunn/goyo.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/wiki.vim'
Plug 'lervag/lists.vim'
Plug 'samgriesemer/vim-roam-md'
Plug 'LukeSmithxyz/vimling'

" Opcionales
Plug 'tomasiser/vim-code-dark'
Plug 'sainnhe/everforest'
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
nnoremap <Leader>e        <CMD>Lexplore<CR>

let g:netrw_banner        = 0
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 3
let g:netrw_sort_options  = 'i'
let g:netrw_winsize       = 20
let g:netrw_list_hide     = '\(^\|\s\s\)\zs\.\S\+'

" [Apariencia]

set background=dark
set termguicolors
let g:everforest_enable_italic = 1
colorscheme everforest
set conceallevel=3
set foldtext='...'
set fillchars=fold:\ 


" [Documentos]

let g:vim_markdown_math          = 1
let g:vim_markdown_frontmatter   = 1
let g:wiki_root                  = '~/Documents'
let g:wiki_filetypes             = ['md']
let g:wiki_link_toggle_on_follow = 0

nnoremap <Leader>s <CMD>set spell!<CR>
nnoremap <Leader>c <CMD>set conceallevel=2<CR>
nnoremap <Leader>C <CMD>set conceallevel=0<CR>
nnoremap <Leader>g <CMD>Goyo<CR>
nnoremap <Leader>t <CMD>TableFormat<CR>

" [Escritura]

set spelllang=es
hi clear SpellBad
hi SpellBad cterm=underline
hi clear Conceal
hi Conceal ctermbg=NONE

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap [[ [[<C-x><C-o><C-p>

let g:latex_to_unicode_file_types = ['markdown']
let g:latex_to_unicode_auto = 1
let g:SuperTabDefaultCompletionType = '<c-n>'
