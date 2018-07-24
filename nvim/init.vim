set nocompatible
filetype off

call plug#begin('~/.config/nvim')
Plug 'https://github.com/tfkhsr/nomolo'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/benekastah/neomake'
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/chrisbra/Colorizer'
Plug 'https://github.com/godlygeek/tabular'

" go
Plug 'https://github.com/fatih/vim-go'
Plug 'https://github.com/zchee/deoplete-go', { 'do': 'make'}

" web
Plug 'https://github.com/prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'https://github.com/pangloss/vim-javascript'

" rails
Plug 'https://github.com/tpope/vim-rails'
call plug#end()

" theme
filetype plugin indent on
syntax enable
colorscheme nomolo

" appearance
set number
set relativenumber
set cursorline
set list
set listchars=tab:▸\ ,eol:¬
set fillchars+=vert:\ 
set tabstop=2
set shiftwidth=2
set noexpandtab
set scrolloff=5
set foldmethod=marker
set autoindent

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
nnoremap <Space> :bn<CR>
nmap ; :
nnoremap zz za
map <C-f> :NERDTreeToggle<CR>
let g:delimitMate_expand_cr = 2

" autcomplete
let g:deoplete#enable_at_startup = 1

" nerdtree
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1

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
let g:go_metalinter_autosave = 0
let g:go_metalinter_enabled = []

" js
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 80
let g:prettier#config#bracket_spacing = 'true'

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

function! SynStack()
	echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunc

" autocommands
autocmd! BufReadPost,BufWritePost * Neomake
autocmd FileType tex setlocal spell spelllang=en_gb
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype c setlocal foldmethod=syntax foldnestmax=1
autocmd BufWritePre *.js,*.jsx,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
autocmd BufWritePre *.hml HairFmt
autocmd BufWritePre *.html call Preserve('normal gg=G')
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
