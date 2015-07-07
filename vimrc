call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'tpope/vim-bundler'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/Rename'
Plug 'sjl/gundo.vim'

" Syntaxes
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'chase/vim-ansible-yaml', { 'for': 'ansible' }
" Plug 'tpope/vim-liquid', { 'for': 'markdown' }

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'gregsexton/Muon'
Plug 'vim-scripts/256-grayvim'
Plug 'croaker/mustang-vim'
Plug 'CruizeMissile/Revolution.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'

call plug#end()

set nocompatible

set nofoldenable
set number
set showmatch
set ignorecase
set hlsearch
set title

set expandtab
set tabstop=2
set shiftwidth=2

set hidden

set noswapfile


nnoremap ; :

" re-open read-only files with sudo
cnoremap w!! w !sudo sh -c "cat > %"

" code search with zeal
nnoremap gz :!zeal --query "<cword>"&<CR><CR>

" window navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
"nnoremap <tab> <c-w>w
"nnoremap <S-tab> <c-w>W

nnoremap <tab> gt
nnoremap <S-tab> gT

" let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = '#%{bufnr("%")}'

" show max 30 search results (default is 10)
let g:ctrlp_match_window = 'max:30'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.bundle$',
  \ 'file': 'tags$',
  \ }

nnoremap <C-N> :NERDTreeToggle<CR>

nnoremap <C-A> :Ack!<space>
nnoremap <C-X> :AckFromSearch!<CR>

let g:seoul256_background = 233
colo seoul256
nnoremap <F5> :GundoToggle<CR>

set noshowmode
let g:airline_powerline_fonts = 1

" file type tweaks
au BufRead,BufNewFile *.hamlc set ft=haml

" ----------------------------------------------------------------------------
" <F8> | Color scheme selector
" ----------------------------------------------------------------------------
function! s:rotate_colors()
	if !exists('s:colors_list')
		let s:colors_list =
					\ sort(map(
					\ filter(split(globpath(&rtp, "colors/*.vim"), "\n"), 'v:val !~ "^/usr/"'),
					\ "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"))
	endif
	if !exists('s:colors_index')
		let s:colors_index = index(s:colors_list, g:colors_name)
	endif
	let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
	let name = s:colors_list[s:colors_index]
	execute 'colorscheme' name
	redraw
	echo name
endfunction
nnoremap <F8> :call <SID>rotate_colors()<cr>

" TODO make this work :)
function! Pandoc()
	let l:from = expand("%:p")
	let l:to = expand("%:p:r")
	!pandoc expand("%:p") -o expand("%:p:r")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'), 'file')
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction
"map <leader>n :call RenameFile()<cr>
