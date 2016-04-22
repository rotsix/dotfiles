set nocompatible
call pathogen#infect()
call pathogen#helptags()

syntax on
set number
set tabstop=2
set autoindent
set smartindent
set mouse=a
set showcmd
set backspace=indent,eol,start



set background=dark
let g:solarized_termcolors=256
" colorscheme flattened-dark
colorscheme desert

hi Normal ctermbg=none
hi CursorLine ctermbg=none
hi luaFunction ctermfg=27
hi t2tTable ctermfg=155
hi t2tTableTit ctermfg=155
hi t2tList ctermfg=127


set guifont=Mono\ 11


set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"


set  tabstop =4
set  shiftwidth =4
set  softtabstop =4

set smartcase

set cursorline


nmap <C-S-N> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


nmap <C-S-P> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Txt2tags syntax
au BufNewFile,BufRead *.t2t                     setf txt2tags

set laststatus=2

set encoding=utf-8
scriptencoding utf-8


let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'component': {
      \   'readonly': '%{&readonly?"\uf26b":""}',
      \ }
      \ }

