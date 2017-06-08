set nocompatible
call pathogen#infect()
call pathogen#helptags()

syntax on
set number
set autoindent
set mouse=a
set showcmd
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]

" indentation
set cindent
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4



set background=dark
let g:solarized_termcolors=256
colorscheme brogrammer
"colorscheme dracula


hi Normal ctermbg=none
hi CursorLine ctermbg=none
" hi Cursorline cterm=bold term=bold gui=bold
hi luaFunction ctermfg=27
hi t2tTable ctermfg=155
hi t2tTableTit ctermfg=155
hi t2tList ctermfg=127


set guifont=Roboto\ Mono\ for\ Powerline\ 11


set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"


" restore shape when leaving
au VimLeave * set guicursor=a:hor20-blinkon175



set smartcase

set cursorline


""""
nmap <C-S-N> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
""""


""""
nmap <C-S-P> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""""


""""
" Txt2tags syntax
au BufNewFile,BufRead *.t2t                     setf txt2tags
au BufNewFile,BufRead *.flex                    setf jflex
""""



set laststatus=2


""""
set encoding=utf-8
scriptencoding utf-8
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

set noshowmode
" }


""""
" indentation comme emacs
set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
set indentkeys=!<Tab>,o,O
map <Tab> i<Tab><Esc>^
filetype indent on
" set cinoptions=:0,(0,u0,W1s
set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s shiftwidth=2
autocmd FileType * setlocal indentkeys+=!<Tab>
""""

""""
" des binds pour aller en fin/début de ligne
map <C-A> <Home>
map <C-E> <End>
imap <C-A> <Home>
imap <C-E> <End>
cmap <C-A> <Home>
cmap <C-E> <End>
"""


" TO SET THE TITLE IN TERM
"""
"let &titlestring = "vim - " . expand("%:t")
"set t_ts=^[k
"set t_fs=^[\
"set title
"auto VimLeave * :set t_ts=^[k^[\
"""

"""
" pour pas qu'il pète les couilles avec un shell qu'est pas POSIX
"""
if &shell =~# 'fish$'
	set shell=bash
endif


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
