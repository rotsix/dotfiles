set nocompatible


""""
"" VIM-PLUG
"{{{
" auto-install vim-plug + plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" colorize all text in the form #rgb, #rgba, #rrggbb, #rrggbbaa, rgb(…), rgba(…)
Plug 'lilydjwg/colorizer'
" status bar
Plug 'itchyny/lightline.vim'
" auto-completion with tab-key
Plug 'ervandew/supertab'
" same NERDTree on all tabs
Plug 'jistr/vim-nerdtree-tabs'
" auto-close backets…
Plug 'Raimondi/delimitMate'
" trololo, NERDTree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle' }
" tabs, easy
Plug 'godlygeek/tabular'
" prettier parentheses
Plug 'https://github.com/kien/rainbow_parentheses.vim'
" colorscheme
Plug 'https://github.com/junegunn/seoul256.vim'
" git integration
Plug 'tpope/vim-fugitive'
" git modifications
Plug 'airblade/vim-gitgutter'
" show methods/functions/… on right
Plug 'majutsushi/tagbar'
" fuzzy file and buffer finder
Plug 'ctrlpvim/ctrlp.vim'
" hide every thing (reading, and writing texts)
Plug 'junegunn/goyo.vim'
" more focus on current paragraph
Plug 'junegunn/limelight.vim'
call plug#end()
"}}}
""""


""""
"" LIMELIGHT
"{{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 240
"}}}
""""


""""
"" COMMON OPTIONS
"{{{
" lol, gotta explain ?
syntax on
" show line numbers
set number
" mh, same, no explainations required
set autoindent
set mouse=a
" show cmd on right
set showcmd
" can go everywhere
set backspace=indent,eol,start
" go to next line with h/l/keys
set whichwrap+=<,>,h,l,[,]
" always show N lines above/below cursor
set scrolloff=5
" autoload file changes
set autoread
" http://vim.wikia.com/wiki/Searching
set ignorecase
set smartcase
" highlight current line
set cursorline
"
filetype plugin on
filetype indent on
set laststatus=2
"}}}
""""


""""
"" INDENTATION
"{{{
set cindent
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
"}}}
""""


""""
"" COLORS
"{{{
colorscheme brogrammer
hi Normal ctermbg=none
hi CursorLine ctermbg=none
" hi Cursorline cterm=bold term=bold gui=bold
hi luaFunction ctermfg=27
hi t2tTable ctermfg=155
hi t2tTableTit ctermfg=155
hi t2tList ctermfg=127
"}}}
""""


""""
"" GUI-FONT
"{{{
" i don't use GUI :(
"set guifont=Roboto\ Mono\ for\ Powerline\ 11
"}}}
""""


""""
"" STATUS-BAR
"{{{
" useful when not using lightline
"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"}}}
""""


""""
"" CURSOR SHAPE
"{{{
" restore shape when leaving
set guicursor=
" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" au VimLeave * set guicursor=a:hor20-blinkon175
"}}}
""""


""""
"" HIGHLIGHT CLASSES
"{{{
" name, use for hilighting
nmap <C-S-N> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}
""""


""""
"" NERDTREE
"{{{
" open NerdTree when nothing is opened
nmap <C-S-P> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"}}}
""""


""""
"" RAINBOW-PARENTHESES
"{{{
" always-on colorize parentheses
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesActivate
"}}}
""""

""""
"" TAGBAR
"{{{
" open tagbar on startup
"autocmd StdinReadPre * let s:std_in = 1
"autocmd vimenter * f argc() == 0 || !exists("s:std_in") | TagbarClose | TagbarOpen | endif
" default : 40
let g:tagbar_width = 40
" hide <F1>, ? for help
let g:tagbar_compact = 1
" more compact
let g:tagbar_indent = 1
"}}}
""""


""""
"" TXT2TAGS
"{{{
" Txt2tags syntax
au BufNewFile,BufRead *.t2t                     setf txt2tags
au BufNewFile,BufRead *.flex                    setf jflex
"}}}
""""



""""
"" ENCODAGE
"{{{
" should I explain ?
set encoding=utf-8
scriptencoding utf-8
"}}}
""""


""""
"" LIGHTLINE
"{{{
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
"}}}
""""


""""
"" INDENTATION
"{{{
" tab to indent (emacs-like)
set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
set indentkeys=!<Tab>,o,O
map <Tab> i<Tab><Esc>^
" set cinoptions=:0,(0,u0,W1s
set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s shiftwidth=2
autocmd FileType * setlocal indentkeys+=!<Tab>
"}}}
""""


""""
"" TO SET THE TITLE IN TERM
"{{{
"let &titlestring = "vim - " . expand("%:t")
"set t_ts=^[k
"set t_fs=^[\
"set title
"auto VimLeave * :set t_ts=^[k^[\
"}}}
""""


""""
"" FISH
"{{{
" 'cuz fish isn't posix
if &shell =~# 'fish$'
	set shell=bash
endif
"}}}
""""


""""
"" BINDS
"{{{
" home/end -> begin/end of line
map <C-A> <Home>
map <C-E> <End>
imap <C-A> <Home>
imap <C-E> <End>
cmap <C-A> <Home>
cmap <C-E> <End>
"}}}
""""

""""
"" VIM-NERDTREE-TABS
"{{{
" binds
nnoremap <silent> <C-Right> <Esc>:tabnext<CR>
nnoremap <silent> <C-Left> <Esc>:tabprev<CR>
nnoremap <silent> <C-S-Tab> :tabprev<CR>
nnoremap <silent> <C-Tab> :tabnext<CR>
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-w> <Esc>:tabclose<CR>
"}}}
""""

" vim: fdm=marker:
