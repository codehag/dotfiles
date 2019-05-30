call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-bundler'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-slash'
Plug 'junegunn/rainbow_parentheses.vim'

" Syntaxes
Plug 'pmsorhaindo/syntastic-local-eslint.vim'
Plug 'flowtype/vim-flow'
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'isRuslan/vim-es6'
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'lambdatoast/elm.vim'
Plug 'vim-scripts/VimClojure'
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'idris-hackers/idris-vim'
Plug 'hellerve/carp-vim'
Plug 'the-lambda-church/coquille'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ---------------------------------------------------------------------------
" Global file type settings
" ---------------------------------------------------------------------------

set encoding=utf-8
set nocompatible

set nofoldenable
set number
set showmatch
set ignorecase
set hlsearch
set title
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set noswapfile
set pastetoggle=<C-\>
set guioptions-=r
set guioptions-=L
set tw=100

if has('nvim')
  runtime! plugin/python_setup.vim
endif

" ---------------------------------------------------------------------------
" Local file type settings
" ---------------------------------------------------------------------------
" autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

inoremap jj <esc>
nnoremap ; :

" window navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab> gt
nnoremap <S-tab> gT

" ----------------------------------------------------------------------------
" syntastic setup
" ----------------------------------------------------------------------------
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['javascript', 'jsx' ],
                            \ 'passive_filetypes': [] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_javascript_checkers = ['eslint']

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" show max 30 search results (default is 10)
let g:ctrlp_match_window = 'max:30'
let g:ctrlp_show_hidden = 1

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|bundle)|node_modules|dist$',
  \ 'file': '\v\.(exe|so|dll)|tags$',
  \ }
let g:ctrlp_lazy_update=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" ----------------------------------------------------------------------------
" General Setup
" ----------------------------------------------------------------------------

nnoremap <C-N> :NERDTreeToggle<CR>

nnoremap <C-A> :Ack!<space>

syntax enable
set t_Co=256
colorscheme solarized
set background=light
let g:syntastic_carp_checkers = ['carp']

syntax on
filetype on
filetype plugin indent on

set noshowmode
let g:airline_powerline_fonts = 1
let g:limelight_conceal_ctermfg = 1
let g:airline#extensions#tabline#enabled = 1

" remove white space on save
autocmd BufWritePre * :%s/\s\+$//e

set shell=/bin/bash

" file type tweaks
au BufRead,BufNewFile *.hamlc set ft=haml
