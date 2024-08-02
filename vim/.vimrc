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
" Plug 'vimwiki/vimwiki'
Plug 'lervag/wiki.vim'
Plug 'JuliaEditorSupport/julia-vim'
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

set background=dark
" set termguicolors
colorscheme dim

set foldtext='‣'
set fillchars=fold:\ 
hi Folded guibg=NONE

set conceallevel=0
let g:vimwiki_list = [{'path': '~/OMNIA/areae/codex/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
let g:limelight_conceal_ctermfg = 8
let g:vim_markdown_math = 1
let g:wiki_root = '~/OMNIA/areae/codex'
let g:wiki_export = {
      \ 'args' : '',
      \ 'from_format' : 'markdown',
      \ 'ext' : 'pdf',
      \ 'link_ext_replace': v:false,
      \ 'view' : v:true,
      \ 'output': fnamemodify(tempname(), ':h'),
      \}
nnoremap <Leader>s <CMD>set spell!<CR>
nnoremap <Leader>c <CMD>set conceallevel=2<CR>
nnoremap <Leader>C <CMD>set conceallevel=0<CR>
nnoremap <leader>f :Goyo <bar> highlight StatusLineNC ctermfg=white<CR>:Limelight<CR>

function! NewNote()
  let timestamp = strftime("%Y%m%d%H%M%S")
  let new_filename = timestamp . ".md"
  execute 'edit ' . new_filename
endfunction
nnoremap <leader>wne :call NewNote()<CR>

function! ReNote()
  let current_file = expand('%:t:r')
  let timestamp = strftime("%Y%m%d%H%M%S")
  let new_filename = timestamp . ".md"
  let response_text = "Re: [[" . current_file .  "]]\n\n\n\n#hilos\n"
  execute 'edit ' . new_filename
  call append(0, split(response_text, '\n'))
endfunction
nnoremap <leader>wre :call ReNote()<CR>3k

hi clear SpellBad
hi SpellBad cterm=italic
hi Conceal ctermbg=none

" [Escritura]

set spelllang=es

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

inorea DATE <C-R>=strftime('%Y-%m-%d')<CR>
inorea NOW <C-R>=strftime('%Y-%m-%d %H:%M')<CR>

let g:latex_to_unicode_file_types = ['text', 'markdown', 'vimwiki', 'julia', 'python']
let g:quicktex_math_filetypes = ['tex', 'pandoc', 'markdown', 'vimwiki']
let g:SuperTabDefaultCompletionType = '<c-n>'


