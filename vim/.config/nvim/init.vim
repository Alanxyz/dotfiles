" =====================
"  Vim - configuracion
" =====================
" [Plugins]

call plug#begin('~/.vim/plugged')
  Plug 'jeffkreeftmeijer/vim-dim'
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/goyo.vim'

	Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'codota/tabnine-vim'

	Plug 'sirver/ultisnips'
	Plug 'lervag/vimtex'
	Plug 'KeitaNakamura/tex-conceal.vim'
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
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set nobackup
set nowritebackup
set noswapfile

set updatetime=300
set shortmess+=c

colorscheme dim

nnoremap <silent> <Tab>      :bn<CR>
nnoremap <silent> <S-Tab>    :bp<CR>

" [Opciones para codigo]

set wildignore+=**/node_modules/** 

" [Opciones para documentos]

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" setlocal spell
set spelllang=es
hi clear SpellBad
hi SpellBad cterm=underline
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
