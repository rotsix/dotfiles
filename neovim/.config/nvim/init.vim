set nocompatible

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoloads/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Colorizer: colorize #rgb, #rgba, #rrggbb, #rrggbbaa, rgb(...), rgba(...)
Plug 'lilydjwg/colorizer'

" Auto Pairs: insert or delete brackets, parens, quotes in pairs
Plug 'jiangmiao/auto-pairs'

" NerdTree: tree view of directories
Plug 'scrooloose/nerdtree'

" Gitgutter: display git diff info
Plug 'airblade/vim-gitgutter'

" Dracula: a spooky theme
"Plug 'dracula/vim'
" Gruvbox: pretty theme (darker-fork)
Plug 'rotsix/gruvbox'
Plug 'itchyny/landscape.vim'

" Yats: typescript syntax
Plug 'HerringtonDarkholme/yats.vim'

" Polyglot: syntax highlighting for common languages
Plug 'sheerun/vim-polyglot'

" Auto Omni: trigger omnicomplete popup menu automatically
" Plug 'BrandonRoehl/auto-omni'

" Ale: asynchronous lint engine
Plug 'w0rp/ale'

" Vim Sleuth: automatically set tabstop
Plug 'tpope/vim-sleuth'

" Lightline: prettier status bar
Plug 'itchyny/lightline.vim'

" Black: python code formatter
Plug 'ambv/black'

" Goyo: distraction free
Plug 'junegunn/goyo.vim'

" Tabular: align things
Plug 'godlygeek/tabular'

" Vim Prolog: better prolog supper
Plug 'mxw/vim-prolog'

" Vim Orgmode: org-mode in vim
Plug 'jceb/vim-orgmode'

" Fzf: fuzzy finder/commands
Plug 'junegunn/fzf.vim'

" Pydiction: python omni-completion
Plug 'vim-scripts/Pydiction'

" Vim Stariy: start screen
Plug 'mhinz/vim-startify' 

" IndentLine: indentation guides/lines
Plug 'Yggdroot/indentLine'

call plug#end()

" reload config quickly
command! ReloadConfig exec "source ~/.config/nvim/init.vim"

" leader key is comma
let mapleader = ','

" quick exit/save
nnoremap <silent> <Leader>w :w!<Cr>

" hide search highlights with ,<Cr>
noremap <silent> <Leader><Cr> :noh<Cr>

" prettier colorscheme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" and some ameliorations
"highlight Normal ctermbg=None
highlight luaFunction ctermfg=27
highlight Comment cterm=italic
highlight Todo ctermbg=red

" set syntax
syntax on

" show line number
set number

" auto-indentation
set autoindent

" mouse
set mouse=a

" copy/paste using primary clipboard
set clipboard=unnamedplus

" hide cmd
set noshowcmd

" hide ruler
set noruler

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
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

" and move faster please
nnoremap <silent> J 3j
nnoremap <silent> K 3k
nnoremap <silent> <S-Down> 3j
nnoremap <silent> <S-Up> 3k

" chdir to current file on BufEnter
set autochdir

" c indent
set cindent

" reload files from disk (not modified)
set autoread

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
      \ 'colorscheme': 'landscape',
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

" vim.fzf config
let g:fzf_layout = { 'down': '~30%' }
nnoremap <silent> <C-M-t> :Files<Cr>
inoremap <silent> <C-M-t> <Esc>:Files<Cr>

nnoremap <silent> <C-p> :Tags<Cr>
inoremap <silent> <C-p> <Esc>:Tags<Cr>

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }


" hide -- INSERT bar
set noshowmode

" tab to indent (like emacs)
set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
set indentkeys=!<Tab>,o,O
noremap <silent> <Tab> i<Tab><Esc>^
set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s shiftwidth=2
autocmd FileType * setlocal indentkeys+=!<Tab>

" auto-complete
inoremap <silent> <C-Space> <C-x><C-o>

" pretty tabs
nnoremap <silent> <C-S-Tab> :tabprevious<Cr>
nnoremap <silent> <C-Tab>   :tabnext<Cr>
nnoremap <silent> <C-t>     :tabnew<Cr>
nnoremap <silent> <C-w>     :tabclose<Cr>
inoremap <silent> <C-S-Tab> <Esc>:tabprevious<Cr>i
inoremap <silent> <C-Tab>   <Esc>:tabnext<Cr>i
inoremap <silent> <C-t>     <Esc>:tabnew<Cr>
inoremap <silent> <C-w>     <Esc>:tabclose<Cr>

" panes
set splitbelow
set splitright
nnoremap <silent> <M-Up> :wincmd k<Cr>
nnoremap <silent> <M-Down> :wincmd j<Cr>
nnoremap <silent> <M-Left> :wincmd h<Cr>
nnoremap <silent> <M-Right> :wincmd l<Cr>

nnoremap <silent> <M-S-Up> :wincmd K<Cr>
nnoremap <silent> <M-S-Down> :wincmd J<Cr>
nnoremap <silent> <M-S-Left> :wincmd H<Cr>
nnoremap <silent> <M-S-Right> :wincmd L<Cr>

" ctrl a-e go to bol/eol
noremap <silent> <C-a> ^
noremap <silent> <C-e> $
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
"cnoremap <silent> <C-a> ^
"cnoremap <silent> <C-e> $

" show buffers
nnoremap <silent> <C-b> :Buffers<Cr>
inoremap <silent> <C-b> <Esc>:Buffers<Cr>

" no command history please
nnoremap <silent> q: :q

" hide hightlight when not searching ('/' key)
nnoremap <silent> <Esc> :noh<Esc>

" black config
" auto-format python on save
autocmd BufWritePost *.py silent! execute ':Black'
" python virtual-envs
let g:black_virtualenv = '/home/victor/.virtual-env/black'

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

if exists("$VIRTUAL_ENV")
  let g:python3_host_prog=substitute(system("which -a python | head -n2 | tail -n1"), "\n", '', 'g')
else
  let g:python3_host_prog=substitute(system("which python"), "\n", '', 'g')
endif

" git-gutter refresh more often
set updatetime=100

" nerdtree config
"autocmd vimenter * NERDTree
noremap <silent> <F6> :NERDTreeToggle<Cr>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" auto-pairs config
autocmd FileType vim let b:AutoPairs = AutoPairsDefine({'\v^\s*\zs"': ''})

" tags config
autocmd FileType c,cpp set tags+=~/.config/nvim/tags/c-cpp
function! SessionAddTags(...)
  execute "!echo 'set tags+=" . a:2 . "' >> ~/.local/share/nvim/session/" . a:1
endfunction
command! -nargs=+ SessionAddTags call SessionAddTags <args>
" set tags+=~/.config/nvim/tags/c-cpp

" ale config
let g:ale_linters = {
      \ 'python': ['black']
      \}
let g:ale_fixers = {
      \ 'python': ['black']
      \}

" merlin config
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" pydiction config
let g:pydiction_location = '/home/victor/.config/nvim/plugged/Pydiction/complete-dict'
let g:pydiction_menu_height = 5

" startify config
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = []
autocmd TabNewEntered * Startify
let g:startify_session_before_save = [
      \ 'echo "Cleaning up before saving.."',
      \ 'silent! NERDTreeClose',
      \ ]
let g:startify_bookmarks = [
      \ { 'v': '~/.config/nvim/init.vim' },
      \ { 'z': '~/.zshrc' },
      \ { 'i': '~/.config/i3/config' },
      \ { 't': '~/.config/termite/config' },
      \ { 'm': '~/.config/mutt/muttrc' }
      \ ]

" indentline config
let g:indentLine_color_term = 234
let g:indentLine_char = '│'
