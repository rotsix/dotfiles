" plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  	autocmd VimEnter * PlugInstall
endif
call plug#begin("~/.local/share/nvim/plugged")

" minimal completion with tab
Plug 'ajh17/VimCompletesMe'
set completeopt=menuone,longest

" syntax for ALL files
Plug 'sheerun/vim-polyglot'

" pain-less tags management
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = expand('~/.cache/tags')
noremap <M-Left> <C-T>
noremap <M-Right> <C-]>
noremap <M-h> <C-T>
noremap <M-l> <C-]>

" quoting/parenthesizing
Plug 'tpope/vim-surround'

" latex
Plug 'lervag/vimtex', { 'for': 'tex' }

" because, go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" and because python
Plug 'psf/black', { 'for': 'python' }
let g:black_virtualenv = '~/.virtual-env/black'
autocmd BufWritePre *.py silent! execute ':Black'

" and don't forget rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1
Plug 'rhysd/rust-doc.vim', { 'for': 'rust' }

" repeating commands (useful for surround)
Plug 'tpope/vim-repeat'

" lint
Plug 'w0rp/ale'
let g:ale_fixers = {
			\ '*': ['remove_trailing_lines', 'trim_whitespace'],
			\ }
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" detect indentation
Plug 'tpope/vim-sleuth'

" fuzzy finding for everything (files, buffers..)
if empty(glob('/usr/bin/fzf'))
  	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
endif
Plug 'junegunn/fzf.vim'
inoremap <C-b> <Esc>:Buffers<CR>
nnoremap <C-b> :Buffers<CR>
inoremap <C-e> <Esc>:Files<CR>
nnoremap <C-e> :Files<CR>
inoremap <C-t> <Esc>:Tags<CR>
nnoremap <C-t> :Tags<CR>

call plug#end()

" colorsceheme
colorscheme newbz

" common options
set number "relativenumber
set cursorline
syntax on
filetype on
filetype plugin on
filetype indent on
set autoindent
set mouse=a
set clipboard=unnamedplus " universal clipboard
set wrap
set linebreak
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set scrolloff=5
set autowrite
set autoread
set ignorecase
set smartcase
set noshowmode
set incsearch
set hlsearch
set autochdir " cd to current file dir
" indentation
set cindent
set copyindent
set preserveindent
set noexpandtab
set softtabstop=0
set shiftwidth=4
set tabstop=4
" splits orientations
set splitbelow
set splitright
" better incrementation/decrementation with ^A/^X
set nrformats+=alpha
set virtualedit=all

" exit insert mode with jk/kj
inoremap <silent> jk <Esc>
inoremap <silent> kj <Esc>

" autoclose ", ', (, [, {    (plugins are so useless)
" inoremap <silent> " ""<Left>
" inoremap <silent> <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
" inoremap <silent> ' ''<Left>
" inoremap <silent> <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
" inoremap <silent> "" ""
" inoremap <silent> '' ''
inoremap <silent> ( ()<Left>
inoremap <silent> <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <silent> [ []<Left>
inoremap <silent> <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <silent> { {}<Left>
inoremap <silent> <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <silent> {<CR> {<CR>}<ESC>O
inoremap <silent> {;<CR> {<CR>};<ESC>O
inoremap <silent> () ()
inoremap <silent> [] []
inoremap <silent> {} {}

" wrapped lines are multiple lines with j/k
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

" hide hightlight when not searching ('/' key)
nnoremap <silent> <Esc> :noh<Esc>

" leave insert mode in terminal with Esc
tnoremap <silent> <Esc> <C-\><C-n>

" latex mode (export to PDF on save + aspell)
augroup tex
  	autocmd!
  	autocmd BufWritePost *.tex silent! !latexmk -pdf %
  	autocmd FileReadPost *.tex silent! setlocal spell spelllang=fr
  	let g:tex_comment_nospell=1
augroup END

" files templates
augroup templates
	autocmd!
	autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
	autocmd BufNewFile *.py 0r ~/.config/nvim/templates/skeleton.py
augroup END

" indent on save
function! Preserve(command)
  let search = @/
  let cursor_position = getpos('.')
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)
  execute a:command
  let @/ = search
  call setpos('.', window_position)
  normal! zt
  call setpos('.', cursor_position)
endfunction

function! Indent()
  call Preserve('normal gg=G')
endfunction

autocmd BufWritePre *.c,*.sh,*.xml call Indent()

" prettier status line
highlight User1 ctermfg=white ctermbg=240
highlight User2 ctermfg=white ctermbg=235
" <path> <flags>                       [<percent> <line/column>]
set laststatus=2
set statusline=
set statusline+=%2*                       " set colors
set statusline+=%1*\ %F\ %2*              " file full path
set statusline+=\ %h%w%m%r                " help file + modified + read only
set statusline+=%=%1*                     " swith to right
set statusline+=\ [%p%%,\ %l/%L:%c]       " current line/column
set statusline+=\                         " final space

set fillchars+=vert:\  " vertical separator

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  	if !exists("*synstack")
    	return
  	endif
  	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
