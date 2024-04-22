" =====================
"  Vim - configuración
" =====================

" [Plugins]

call plug#begin('~/.vim/plugged')

" Generales
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'sheerun/vim-polyglot'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

" Escritura
" Plug 'anufrievroman/vim-angry-reviewer'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'vimwiki/vimwiki'
Plug 'brennier/quicktex'

" Opcionales
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kyuhi/vim-emoji-complete'
Plug 'mattn/calendar-vim'

call plug#end()

" [Opciones generales]

set nocompatible
set foldnestmax=2 nofoldenable
set undolevels=1000
set path=**
set hidden
set wildmenu
set ignorecase
set updatetime=300 shortmess+=c
set wrap linebreak
set expandtab tabstop=2 shiftwidth=2 smarttab
set autoindent
set encoding=utf-8
set nobackup nowritebackup noswapfile

nnoremap Q          @q
nnoremap <Leader>r  <CMD>source ~/.vimrc<CR>
nnoremap <Leader>v  <CMD>edit ~/.vimrc<CR>

" [Navegación]

nnoremap <Leader><Leader> <CMD>Files<CR>
nnoremap <silent> <C-j>   <CMD>bn<CR>
nnoremap <silent> <C-k>   <CMD>bp<CR>
nnoremap <Leader>e        <CMD>NERDTreeToggle<CR>

" [Apariencia]

set background=light
" set termguicolors
colorscheme dim

set foldtext='‣'
set fillchars=fold:\ 
hi Folded guibg=NONE

set conceallevel=0
let g:limelight_conceal_ctermfg = 8

" [Documentos]

let g:vimwiki_list = [{'path': '~/codex/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

nnoremap <Leader>s <CMD>set spell!<CR>
nnoremap <Leader>c <CMD>set conceallevel=2<CR>
nnoremap <Leader>C <CMD>set conceallevel=0<CR>
nnoremap <leader>f :Goyo <bar> highlight StatusLineNC ctermfg=white<CR>:Limelight<CR>

hi clear SpellBad
hi SpellBad cterm=italic

" [Escritura]

set spelllang=es

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

inorea DATE <C-R>=strftime('%Y-%m-%d')<CR>
inorea NOW <C-R>=strftime('%Y-%m-%d %H:%M')<CR>

let g:latex_to_unicode_file_types = ['text', 'markdown', 'vimwiki', 'julia']
let g:SuperTabDefaultCompletionType = '<c-n>'


