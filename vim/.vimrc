" =====================
"  Vim - configuración
" =====================

" [Plugins]

let g:polyglot_disabled = ['markdown']
call plug#begin('~/.vim/plugged')

" Generales
Plug 'noahfrederick/vim-noctu'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'

" Escritura
Plug 'lervag/wiki.vim'
Plug 'AstralCam/quicktex'

" Opcionales
Plug 'beikome/cosme.vim'
Plug 'samgriesemer/vim-roam-md'
Plug 'dkarter/bullets.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'

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
set wrap linebreak nolist
set expandtab softtabstop=2 shiftwidth=2 smarttab
set autoindent
set encoding=utf-8
set nobackup nowritebackup noswapfile

" [Navegación]

nnoremap <Leader><Leader> :FZF<CR>
nnoremap <silent> <C-j>   :bn<CR>
nnoremap <silent> <C-k>   :bp<CR>
nnoremap <Leader>e        :Lexplore<CR>

let g:netrw_banner        = 0
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 3
let g:netrw_sort_options  = 'i'
let g:netrw_winsize       = 15
let g:netrw_list_hide     = '\(^\|\s\s\)\zs\.\S\+'

" [Apariencia]

set termguicolors bg=dark
colorscheme cosme
set conceallevel=0

" [Documentos]

let g:tex_conceal                 = 'abdmg'
let g:tex_flavor                  = 'latex'
let g:vimtex_view_method          = 'zathura'
let g:vimtex_quickfix_mode        = 0
let g:vim_markdown_math           = 1
let g:mkdp_browser                = 'surf'
let g:wiki_root                   = '~/Notas'
let g:wiki_journal                = { 'name': 'Diario' }
let g:wiki_filetypes              = ['md']
let g:wiki_link_toggle_on_follow  = 0
let g:vim_markdown_frontmatter    = 1

nnoremap <Leader>s :set spell!<CR>
nnoremap <Leader>c :set conceallevel=2<CR>
nnoremap <Leader>C :set conceallevel=0<CR>
nnoremap <Leader>r :MarkdownRunner<CR>
nnoremap <Leader>R :MarkdownRunnerInsert<CR>
nnoremap <Leader>t :TableFormat<CR>

" [Diccionario]

set spelllang=es,en,la
" hi clear SpellBad
" hi SpellBad cterm=underline
hi clear Conceal
hi Conceal ctermbg=NONE
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
