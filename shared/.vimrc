call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set relativenumber
set number
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
syntax on
set ttyfast
set cursorline
let g:dracula_colorterm = 0
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"Probably need to check for rg or ag
nnoremap <C-P> :Files<CR>
nnoremap <C-X> :Ag<CR>
nnoremap <C-Y> :BLines<CR>

" Bottom
colorscheme dracula
autocmd VimEnter * NERDTree | wincmd p
