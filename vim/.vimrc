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
Plug 'ervandew/supertab'

" Escritura
Plug 'lervag/wiki.vim'
Plug 'junegunn/goyo.vim'
Plug 'samgriesemer/vim-roam-md'
Plug 'JuliaEditorSupport/julia-vim'

" Opcionales
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
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
set expandtab softtabstop=4 shiftwidth=4 smarttab
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

set termguicolors background=dark
colorscheme gruvbox
set conceallevel=3

" [Documentos]

let g:tex_conceal                      = 'abdmg'
let g:tex_flavor                       = 'latex'
let g:vim_markdown_math                = 1
let g:vim_markdown_frontmatter         = 1
let g:pandoc#filetypes#pandoc_markdown = 1
let g:bullets_outline_levels           = ['ast']
let g:wiki_root                        = '~/Documents/Notes'
let g:wiki_journal                     = {'name': 'Diario'}
let g:wiki_filetypes                   = ['md']
let g:wiki_link_toggle_on_follow       = 0
let s:tag_parser = deepcopy(g:wiki#tags#default_parser)
let s:tag_parser.re_match = '\v%(^|\s)#\zs[^# ]+'
let s:tag_parser.re_findstart = '\v%(^|\s)#\zs[^# ]+'
let s:tag_parser.make = {t, l -> empty(t) ? '' : join(map(t, '"#" . v:val'))}
let g:wiki_tag_parsers = [s:tag_parser]

nnoremap <Leader>s <CMD>set spell!<CR>
nnoremap <Leader>c <CMD>set conceallevel=2<CR>
nnoremap <Leader>C <CMD>set conceallevel=0<CR>
nnoremap <Leader>t <CMD>TableFormat<CR>
nnoremap <Leader>g <CMD>Goyo<CR>

iabbrev <expr> today strftime('%Y-%m-%d')
iabbrev <expr> time strftime('%H:%M')
iabbrev <expr> now strftime('%Y-%m-%d %H:%M')

" [Escritura]

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
let g:latex_to_unicode_file_types = 'markdown'
let g:latex_to_unicode_auto = 1
let g:SuperTabDefaultCompletionType = '<c-n>'
