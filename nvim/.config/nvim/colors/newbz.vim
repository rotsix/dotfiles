" Vim color file - newbz
" Generated by http://bytefluent.com/vivify 2019-04-25
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "newbz"

" TODO clear existing highlights before adding new ones
"
" highlight CTagsMember -- no settings --
" highlight CTagsGlobalConstant -- no settings --
highlight Normal ctermfg=NONE ctermbg=NONE cterm=NONE
" highlight CTagsImport -- no settings --
" highlight CTagsGlobalVariable -- no settings --
" highlight EnumerationValue -- no settings --
" highlight Union -- no settings --
" highlight EnumerationName -- no settings --
" highlight DefinedName -- no settings --
" highlight LocalVariable -- no settings --
" highlight CTagsClass -- no settings --
" highlight clear -- no settings --
highlight IncSearch ctermfg=15 ctermbg=240 cterm=NONE
highlight WildMenu ctermfg=81 ctermbg=233 cterm=NONE
highlight SignColumn ctermfg=112 ctermbg=235 cterm=NONE
highlight SpecialComment ctermfg=66 ctermbg=NONE cterm=bold
highlight Typedef ctermfg=81 ctermbg=NONE cterm=NONE
highlight Title ctermfg=209 ctermbg=NONE cterm=NONE
highlight Folded ctermfg=240 ctermbg=NONE cterm=NONE
highlight PreCondit ctermfg=149 ctermbg=NONE cterm=bold
highlight Include ctermfg=lightblue ctermbg=NONE cterm=NONE
highlight Float ctermfg=141 ctermbg=NONE cterm=NONE
highlight StatusLine ctermfg=NONE ctermbg=240 cterm=NONE
highlight StatusLineNC ctermfg=8 ctermbg=235 cterm=NONE
highlight NonText ctermfg=250 ctermbg=NONE cterm=NONE
highlight DiffText ctermfg=141 ctermbg=2 cterm=bold
highlight ErrorMsg ctermfg=196 ctermbg=NONE cterm=bold
highlight Ignore ctermfg=8 ctermbg=NONE cterm=NONE
highlight Debug ctermfg=138 ctermbg=NONE cterm=bold
highlight PMenuSbar ctermfg=81 ctermbg=232 cterm=NONE
highlight Identifier ctermfg=228 ctermbg=NONE cterm=NONE
highlight SpecialChar ctermfg=208 ctermbg=NONE cterm=bold
highlight Conditional ctermfg=124 ctermbg=NONE cterm=bold
highlight StorageClass ctermfg=208 ctermbg=NONE cterm=NONE
highlight Todo ctermfg=NONE ctermbg=red cterm=bold
highlight Special ctermfg=81 ctermbg=NONE cterm=NONE
highlight LineNr ctermfg=15 ctermbg=NONE cterm=NONE
highlight Label ctermfg=228 ctermbg=NONE cterm=NONE
highlight PMenuSel ctermfg=15 ctermbg=234 cterm=NONE
highlight Search ctermfg=15 ctermbg=240 cterm=NONE
highlight Delimiter ctermfg=245 ctermbg=NONE cterm=NONE
highlight Statement ctermfg=202 ctermbg=NONE cterm=NONE
highlight SpellRare ctermfg=255 ctermbg=13 cterm=NONE
highlight Comment ctermfg=66 ctermbg=NONE cterm=NONE
highlight Character ctermfg=228 ctermbg=NONE cterm=NONE
highlight TabLineSel ctermfg=255 ctermbg=NONE cterm=NONE
highlight Number ctermfg=129 ctermbg=NONE cterm=NONE
highlight Boolean ctermfg=91 ctermbg=NONE cterm=NONE
highlight Operator ctermfg=214 ctermbg=NONE cterm=NONE
highlight CursorLine ctermfg=NONE ctermbg=232 cterm=NONE
highlight TabLineFill ctermfg=NONE ctermbg=235 cterm=NONE
highlight Question ctermfg=81 ctermbg=NONE cterm=NONE
highlight WarningMsg ctermfg=15 ctermbg=236 cterm=bold
highlight VisualNOS ctermfg=255 ctermbg=95 cterm=NONE
highlight DiffDelete ctermfg=NONE ctermbg=52 cterm=NONE
highlight ModeMsg ctermfg=228 ctermbg=NONE cterm=NONE
highlight CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
highlight Define ctermfg=124 ctermbg=NONE cterm=bold
highlight Function ctermfg=33 ctermbg=NONE cterm=NONE
highlight FoldColumn ctermfg=240 ctermbg=NONE cterm=NONE
highlight PreProc ctermfg=11 ctermbg=NONE cterm=NONE
highlight Visual ctermfg=255 ctermbg=95 cterm=NONE
highlight MoreMsg ctermfg=228 ctermbg=NONE cterm=NONE
highlight SpellCap ctermfg=255 ctermbg=12 cterm=NONE
highlight VertSplit ctermfg=240 ctermbg=235 cterm=bold
highlight Exception ctermfg=106 ctermbg=NONE cterm=bold
highlight Keyword ctermfg=112 ctermbg=NONE cterm=bold
highlight Type ctermfg=81 ctermbg=NONE cterm=NONE
highlight DiffChange ctermfg=245 ctermbg=239 cterm=NONE
highlight Cursor ctermfg=254 ctermbg=26 cterm=NONE
highlight SpellLocal ctermfg=255 ctermbg=14 cterm=NONE
highlight Error ctermfg=125 ctermbg=254 cterm=NONE
highlight PMenu ctermfg=248 ctermbg=233 cterm=NONE
highlight SpecialKey ctermfg=240 ctermbg=NONE cterm=NONE
highlight Constant ctermfg=91 ctermbg=NONE cterm=bold
highlight Tag ctermfg=117 ctermbg=NONE cterm=NONE
highlight String ctermfg=112 ctermbg=NONE cterm=NONE
highlight PMenuThumb ctermfg=81 ctermbg=NONE cterm=NONE
highlight MatchParen ctermfg=NONE ctermbg=208 cterm=bold
highlight Repeat ctermfg=124 ctermbg=NONE cterm=bold
highlight SpellBad ctermfg=255 ctermbg=9 cterm=NONE
highlight Directory ctermfg=149 ctermbg=NONE cterm=bold
highlight Structure ctermfg=81 ctermbg=NONE cterm=NONE
highlight Macro ctermfg=186 ctermbg=NONE cterm=NONE
highlight Underlined ctermfg=8 ctermbg=NONE cterm=underline
highlight DiffAdd ctermfg=NONE ctermbg=22 cterm=NONE
highlight TabLine ctermfg=255 ctermbg=232 cterm=NONE
highlight type ctermfg=81 ctermbg=NONE cterm=NONE
highlight conceal ctermfg=254 ctermbg=232 cterm=NONE
highlight gitgutterdelete ctermfg=125 ctermbg=233 cterm=bold
highlight gitgutteradd ctermfg=190 ctermbg=233 cterm=bold
highlight cursorline ctermfg=NONE ctermbg=235 cterm=NONE
highlight gitgutterchange ctermfg=202 ctermbg=233 cterm=bold

highlight ocamlConstructor ctermfg=39 ctermbg=NONE cterm=bold
highlight ocamlKeyword ctermfg=196 ctermbg=NONE cterm=NONE
highlight ocamlKeychar ctermfg=226 ctermbg=NONE cterm=NONE
highlight ocamlStar ctermfg=226 ctermbg=NONE cterm=NONE
highlight ocamlAnyVar ctermfg=242 ctermbg=NONE cterm=NONE

highlight User1 ctermfg=white ctermbg=240
highlight User2 ctermfg=white ctermbg=235
