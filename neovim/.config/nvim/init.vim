set nocompatible

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoloads/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Colorizer: colorize all text in the form #rgb, #rgba, #rrggbb, #rrggbbaa,
" rgb(...), rgba(...)
Plug 'lilydjwg/colorizer'

" Vinegar: kind of nerdtree, but simpler/smaller
Plug 'tpope/vim-vinegar'

" Auto Pairs: insert or delete brackets, parens, quotes in pairs
Plug 'jiangmiao/auto-pairs'

" Gitgutter: display git diff info
Plug 'airblade/vim-gitgutter'

" Dracula: a spooky theme
Plug 'dracula/vim'

" Polyglot: syntax highlighting for common languages
Plug 'sheerun/vim-polyglot'

" Ale: asynchronous lint engine
Plug 'w0rp/ale'

" Automatically set tabstop
Plug 'tpope/vim-sleuth'

" Lightline: prettier status bar
Plug 'itchyny/lightline.vim'

call plug#end()


" leader key is comma
let mapleader = ","

" quick exit/save
nmap <leader>w :w!<cr>

" easy split nav
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" hide search highlights with ,<cr>
map <silent> <leader><cr> :noh<cr>

" prettier colorscheme
color dracula

" and some ameliorations
hi Normal ctermbg=none
hi CursorLine ctermbg=none
hi luaFunction ctermfg=27
hi Comment cterm=italic

" set syntax
syntax on

" show line number
set number

" auto-indentation
set autoindent

" mouse
set mouse=a

" show cmd on right on statusbar
set showcmd

" keys/hjkl can go on new lines/*
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]

" always show N lines above/below cursor
set scrolloff=5

" autoload file changes
set autoread

" smarter searching
set ignorecase
set smartcase

" highlight current line
set cursorline

" wrapped lines are multiple lines with j/k
map j gj
map k gk

" c indent
set cindent

" spaces
set noexpandtab

" keep current indent
set copyindent
set preserveindent

" tab length
set softtabstop=0
set shiftwidth=4
set tabstop=4

" cursor in gui
set guicursor=

" all in UTF-8
set encoding=utf-8
scriptencoding utf-8

" lightline config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
 			\ }

function! LightlineModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
	return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
	if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
		let branch = fugitive#head()
		return branch !=# '' && winwidth(0) > 50 ? ' '.branch : ''
	endif
	return ''
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
	return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" hide -- INSERT bar
set noshowmode

" tab to indent (like emacs)
set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
set indentkeys=!<Tab>,o,O
map <Tab> i<Tab><Esc>^
set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s shiftwidth=2
autocmd FileType * setlocal indentkeys+=!<Tab>

" ctrl a-e go to bol/eol
map <C-A> <Home>
map <C-E> <End>
imap <C-A> <Home>
imap <C-E> <End>
cmap <C-A> <Home>
cmap <C-E> <End>
