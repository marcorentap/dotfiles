call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
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
set guicursor=

let g:dracula_colorterm = 0
let NERDTreeShowHidden = 1

" Bottom
colorscheme dracula
autocmd VimEnter * NERDTree | wincmd p
