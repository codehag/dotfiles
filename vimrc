call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'tpope/vim-bundler'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-tbone'
Plug 'pmeinhardt/thrasher'

" Syntaxes
Plug 'pmsorhaindo/syntastic-local-eslint.vim'
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'isRuslan/vim-es6'
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'lambdatoast/elm.vim'
Plug 'vim-scripts/VimClojure'
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'gregsexton/Muon'
Plug 'vim-scripts/256-grayvim'
Plug 'croaker/mustang-vim'
Plug 'CruizeMissile/Revolution.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'
Plug 'scwood/vim-hybrid'
Plug 'Lokaltog/vim-distinguished'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

" Productivity
Plug 'mnick/vim-pomodoro'

" JavaScript setup

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

" ---------------------------------------------------------------------------
" Local file type settings
" ---------------------------------------------------------------------------
" autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

inoremap jj <esc>
nnoremap ; :

" re-open read-only files with sudo
cnoremap w!! w !sudo sh -c "cat > %"

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
let g:airline_theme='dark'

" show max 30 search results (default is 10)
let g:ctrlp_match_window = 'max:30'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': ['\.bundle$', 'node_modules', 'dist'],
  \ 'file': 'tags$',
  \ }

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
colorscheme OceanicNext
set background=dark

nnoremap <F5> :GundoToggle<CR>
nnoremap <C-E> :TagbarToggle<CR>
map <C-c> "+y<CR>

set noshowmode
let g:airline_powerline_fonts = 1
let g:limelight_conceal_ctermfg = 1

" remove white space on save
autocmd BufWritePre * :%s/\s\+$//e

" file type tweaks
au BufRead,BufNewFile *.hamlc set ft=haml

" ----------------------------------------------------------------------------
" Time Management
" ----------------------------------------------------------------------------

" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25
"
" " Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5
"
" " Log completed pomodoros, 0 = False, 1 = True (default: 0)
let g:pomodoro_do_log = 0
"
" " Path to the pomodoro log file (default: /tmp/pomodoro.log)
let g:pomodoro_log_file = "/tmp/pomodoro.log"
set statusline=%#ErrorMsg#%{PomodoroStatus()}%#StatusLine#
