" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    settings.vim                                       :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: wsz </var/spool/mail/wsz>                  +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/02/26 22:50:51 by wsz               #+#    #+#              "
"    Updated: 2022/02/26 22:50:53 by wsz              ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" TIDAL
"let g:tidal_target = "terminal"


" ?
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

"################################################ "
"### WILDER MENU ### "
"################################################

call wilder#setup({
			\ 'modes': [':', '/', '?'],
			\ })

call wilder#set_option('pipeline', [
			\   wilder#branch(
			\     wilder#cmdline_pipeline({
			\       'hide_in_substitute': 1,
			\       'fuzzy': 1,
			\       'set_pcre2_pattern': 1,
			\     }),
			\     wilder#python_search_pipeline({
			\       'pattern': 'fuzzy',
			\     }),
			\   ),
			\ ])

call wilder#set_option('renderer', wilder#wildmenu_renderer(
			\ wilder#wildmenu_airline_theme({
			\   'highlights': {},
			\   'highlighter': wilder#basic_highlighter(),
			\   'separator': ' · ',
			\ })))

nnoremap / :call WilderStart()<CR>
function! WilderStart()
	call wilder#start_from_normal_mode()
	ScrollViewDisable
	call feedkeys('/', 'n')
endfunction
autocmd CmdlineLeave * ScrollViewEnable

"let s:highlighters = [
""\ wilder#pcre2_highlighter(),
			"\ wilder#basic_highlighter(),
			"\ ]

"call wilder#set_option('renderer', wilder#renderer_mux({
			"\ ':': wilder#popupmenu_renderer({
			"\   'highlighter': s:highlighters,
			"\ }),
			"\ '/': wilder#wildmenu_renderer({
			"\   'highlighter': s:highlighters,
			"\ }),
			"\ }))
"
"################################################ "
"### RESTORE VIEW ### "
"################################################ "

set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']

"################################################ "
"### NCOC ### "
"################################################ "

":CocConfig >
"
"{
"	"coc.preferences.semanticTokensHighlights": false,
"	"diagnostic.checkCurrentLine": true,
"	"codeLens.enable": true,
"	"diagnostic.virtualText": true,
"	"diagnostic.virtualTextCurrentLineOnly" : false,
"
"	"Lua": {
"		"workspace.library": {
"			"/usr/share/nvim/runtime/lua": true,
"			"/usr/share/nvim/runtime/lua/vim": true,
"			"/usr/share/nvim/runtime/lua/vim/lsp": true,
"		},
"		"diagnostics": {
"			"globals": ["vim"]
"		}
"	},
"}

runtime! plugin/supertab.vim
inoremap <s-tab>  <tab>
nnoremap gd       :call       CocActionAsync('doHover')<CR>
nnoremap gD       :call       CocActionAsync('jumpDefinition')<CR>
nmap     <silent> <C-k>       <Plug>(coc-diagnostic-prev)
nmap     <silent> <C-j>       <Plug>(coc-diagnostic-next)

"################################################# "
"### EASY ALIGN ###
"################################################ "

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
map g=  gaip*=
map g\| gaip*\|
map g.  gaip*.
map g,  gaip*,
map g<Space> gaip*<Space>

"################################################ "
"### FOOTPRINTS ### "
"################################################ "

let g:footprintsColor            = '#3A3A3A'
let g:footprintsTermColor        = '208'
let g:footprintsEasingFunction   = 'linear'
let g:footprintsHistoryDepth     = 20
let g:footprintsExcludeFiletypes = ['magit', 'neo-tree', 'diff']
let g:footprintsEnabledByDefault = 1
let g:footprintsOnCurrentLine    = 0

"################################################ "
"### AIRLINE ### "
"################################################ "

let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme                        = 'gruvbox_material'
"let g:airline_theme='base16'
"let g:airline#extensions#tabline#formatter = 'default'
"
"################################################ "
"### RAINBOW BRACKETS ### "
"################################################ "

map <C-b>                                  :RainbowToggle<CR>
"let g:rainbow_active = 1

"################################################ "
"### 42 HEADER ### "
"################################################ "

nmap <F12> :FortyTwoHeader<CR>
let b:fortytwoheader_user="wszurkow"
let b:fortytwoheader_mail="wszurkow@student.42.fr"

"################################################ "
"### HEX HIGHLIGHT### "
"################################################ "
"
nmap <F2>			<ESC>:ColorToggle<CR>

"################################################ "
"### NEO TREE ### "
"################################################ "

nmap <C-p> :NeoTreeFocusToggle<CR>
nnoremap <silent> <C-d> :NeoTreeFloatToggle<CR>
"defaults.lua
"      folder_closed = "",
"     folder_open = "",
"    default = "כּ",

"highlights.lua
"116:  create_highlight_group(M.DIRECTORY_ICON, {}, nil, "d8a657")

"################################################ "
"### VISUAL-MULTIPLE-CURSORS ### "
"################################################ "

let g:VM_maps = {}
let g:VM_maps["Select All"]                  = '\\a'
let g:VM_maps["Add Cursor Down"]             = '<S-Down>'
let g:VM_maps["Add Cursor Up"]               = '<S-Up>'
let g:VM_maps["Add Cursor At Pos"]           = '\\\'
let g:VM_maps['Find Under']                  = '<C-n>'
"let g:VM_maps['Find Subword Under']          = '<C-n>'
"let g:VM_maps["Start Regex Search"]          = '\\/'
"let g:VM_maps["Visual Regex"]                = '\\/'
"let g:VM_maps["Visual All"]                  = '\\a'
"let g:VM_maps["Visual Add"]                  = '\\a'
"let g:VM_maps["Visual Find"]                 = '\\f'
"let g:VM_maps["Visual Cursors"]              = '\\c'

"################################################ "
"### FZF ### "
"################################################ "

nnoremap <silent> <C-f> :Files<CR>
let g:fzf_preview_window = 'right:60%'

"################################################ "
"### UNDOTREE ### "
"################################################ "
"
nnoremap <C-u> :UndotreeToggle<cr>
let g:undotree_WindowLayout         = 2
let g:undotree_ShortIndicators      = 1
let g:undotree_SetFocusWhenToggle   = 1
let g:undotree_HighlightChangedText = 1
let g:undotree_HelpLine             = 1
if has("persistent_undo")
	try
		set undodir=~/.undodir
		set undofile
	catch
	endtry
endif

"################################################ "
"### TOGGLE TERM ### "
"################################################ "

"autocmd TermEnter term://*toggleterm#*
	  "\ tnoremap <silent><Leader>t <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>

"" By applying the mappings this way you can pass a count to your
"" mapping to open a specific window.
"" For example: 2<C-t> will open terminal 2
"nnoremap <silent><Leader>t <Cmd>exe v:count1 . "ToggleTerm height=20 direction=horizontal"<CR>
"nnoremap <silent><Leader>T <Cmd>exe v:count1 . "ToggleTerm height=20 direction=float"<CR>

"inoremap <silent><Leader>t <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

