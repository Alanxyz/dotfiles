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
Plug 'junegunn/goyo.vim'
Plug 'samgriesemer/vim-roam-md'
Plug 'dkarter/bullets.vim'
Plug 'AstralCam/math-abbreviations'

" Opcionales
Plug 'beikome/cosme.vim'
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

nnoremap Q @q

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
hi mkdHeader cterm=bold
hi mkdH1 cterm=bold
hi mkdH2 cterm=bold
hi mkdH3 cterm=bold
hi mkdH4 cterm=bold

" [Documentos]

let g:tex_conceal                      = 'abdmg'
let g:tex_flavor                       = 'latex'
let g:vim_markdown_math                = 1
let g:vim_markdown_frontmatter         = 1
let g:pandoc#filetypes#pandoc_markdown = 1
let g:bullets_outline_levels           = ['std-']
let g:wiki_root                        = '~/Notas'
let g:wiki_journal                     = {'name': 'Diario'}
let g:wiki_filetypes                   = ['md']
let g:wiki_link_toggle_on_follow       = 0
let s:tag_parser = deepcopy(g:wiki#tags#default_parser)
let s:tag_parser.re_match = '\v%(^|\s)#\zs[^# ]+'
let s:tag_parser.re_findstart = '\v%(^|\s)#\zs[^# ]+'
let s:tag_parser.make = {t, l -> empty(t) ? '' : join(map(t, '"#" . v:val'))}
let g:wiki_tag_parsers = [s:tag_parser]

nnoremap <Leader>s :set spell!<CR>
nnoremap <Leader>c :set conceallevel=2<CR>
nnoremap <Leader>C :set conceallevel=0<CR>
nnoremap <Leader>t :TableFormat<CR>
nnoremap <Leader>g :Goyo<CR>

" [Diccionario]

set spelllang=es
hi clear SpellBad
hi SpellBad cterm=underline
hi clear Conceal
hi Conceal ctermbg=NONE
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap [a á
inoremap [e é
inoremap [i í
inoremap [o ó
inoremap [u ú
inoremap ;; ñ
inoremap [[ [[<C-x><C-o><C-p>
