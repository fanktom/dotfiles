set nocompatible
filetype off

call plug#begin('~/.config/nvim')

Plug 'funkhousr/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'html'] }
Plug 'junegunn/vim-easy-align'
Plug 'jamessan/vim-gnupg'

call plug#end()

" theme
filetype plugin indent on
syntax enable
set t_Co=256
let g:rehash256 = 1
colorscheme molokai

" appearance
set number
set relativenumber
set cursorline
set list
set listchars=tab:▸\ ,eol:¬
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=5
set foldmethod=marker

" background
set mouse=a
set fileformats=unix
set encoding=utf-8
set nobackup
set nowb
set noswapfile
set hidden
set timeoutlen=1000 ttimeoutlen=0
set autoread
set incsearch
set hlsearch
set clipboard=unnamed
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set showcmd
set completeopt-=preview
set laststatus=2
set statusline=%t\ %=%{&fenc}\ %y

" configs
nnoremap gb :ls<CR>:b<Space>
nmap ; :
nnoremap zz za

" autcomplete
let g:deoplete#enable_at_startup = 1

" linting
let g:neomake_verbose = 0

" go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" js
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 80
let g:prettier#config#bracket_spacing = 'true'

" autocommands
autocmd! BufReadPost,BufWritePost * Neomake
autocmd FileType tex setlocal spell spelllang=en_gb
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype c setlocal foldmethod=syntax foldnestmax=1
autocmd BufWritePre *.js,*.jsx,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
