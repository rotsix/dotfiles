set nocompatible


""""
" auto-install vim-plug + plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" colorize all text in the form #rgb, #rgba, #rrggbb, #rrggbbaa, rgb(…), rgba(…)
Plug 'https://github.com/lilydjwg/colorizer'
" status bar
Plug 'https://github.com/itchyny/lightline.vim'
" auto-completion with tab-key
Plug 'https://github.com/ervandew/supertab.git'
" same NERDTree on all tabs
Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'
" auto-close backets…
Plug 'https://github.com/Raimondi/delimitMate.git'
" trololo, NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git', {'on': 'NERDTreeToggle' }
" tabs, easy
Plug 'https://github.com/godlygeek/tabular.git'
" prettier parentheses
Plug 'https://github.com/kien/rainbow_parentheses.vim'
" colorscheme
Plug 'https://github.com/junegunn/seoul256.vim'
call plug#end()
""""


syntax on
set number
set autoindent
set mouse=a
set showcmd
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]


""""
" indentation
set cindent
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
""""


filetype plugin on
filetype indent on


colorscheme brogrammer
hi Normal ctermbg=none
hi CursorLine ctermbg=none
" hi Cursorline cterm=bold term=bold gui=bold
hi luaFunction ctermfg=27
hi t2tTable ctermfg=155
hi t2tTableTit ctermfg=155
hi t2tList ctermfg=127


""""
" i don't use GUI :(
"set guifont=Roboto\ Mono\ for\ Powerline\ 11
""""


""""
" useful when not using lightline
"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
""""


""""
" restore shape when leaving
set guicursor=
" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" au VimLeave * set guicursor=a:hor20-blinkon175
""""


set smartcase

set cursorline


""""
" name, use for hilighting
nmap <C-S-N> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
""""


""""
" open NerdTree when nothing is opened
nmap <C-S-P> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""""


""""
" always-on colorize parentheses
"au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesActivate
""""


""""
" Txt2tags syntax
au BufNewFile,BufRead *.t2t                     setf txt2tags
au BufNewFile,BufRead *.flex                    setf jflex
""""



set laststatus=2


""""
" should I explain ?
set encoding=utf-8
scriptencoding utf-8
""""


""""
" lightline {
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
		return branch !=# '' ? ' '.branch : ''
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
""""


""""
" indentation, tabs to indent (emacs-like)
set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
set indentkeys=!<Tab>,o,O
map <Tab> i<Tab><Esc>^
" set cinoptions=:0,(0,u0,W1s
set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s shiftwidth=2
autocmd FileType * setlocal indentkeys+=!<Tab>
""""


""""
" home/end -> begin/end of line
map <C-A> <Home>
map <C-E> <End>
imap <C-A> <Home>
imap <C-E> <End>
cmap <C-A> <Home>
cmap <C-E> <End>
"""


""""
" TO SET THE TITLE IN TERM
"let &titlestring = "vim - " . expand("%:t")
"set t_ts=^[k
"set t_fs=^[\
"set title
"auto VimLeave * :set t_ts=^[k^[\
""""


""""
" 'cuz fish isn't posix
if &shell =~# 'fish$'
	set shell=bash
endif
""""


""""
" binds for tabs
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprev<CR>

nnoremap <silent> <C-S-Tab> :tabprev<CR>
nnoremap <silent> <C-Tab> :tabnext<CR>
"nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-l> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-w> <Esc>:tabclose<CR>
""""
