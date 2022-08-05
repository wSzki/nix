hi clear
syntax reset
let g:colors_name = "my-scheme"
set background=dark
set t_Co=256
hi Normal guifg=#000000 ctermbg=NONE guibg=#dadada gui=NONE

hi DiffText              guifg=#000000 guibg=NONE
hi ErrorMsg              guifg=#000000 guibg=NONE
hi WarningMsg            guifg=#000000 guibg=NONE
hi PreProc               guifg=#000000 guibg=NONE
hi Exception             guifg=#000000 guibg=NONE
hi Error                 guifg=#000000 guibg=NONE
hi DiffDelete            guifg=#000000 guibg=NONE
hi GitGutterDelete       guifg=#000000 guibg=NONE
hi GitGutterChangeDelete guifg=#000000 guibg=NONE
hi cssIdentifier         guifg=#000000 guibg=NONE
hi cssImportant          guifg=#000000 guibg=NONE

hi Type                  guifg=#000000 guibg=NONE gui=bold
hi Identifier            guifg=#000000 guibg=NONE gui=underline

hi PMenuSel              gui=underline guifg=#222222 guibg=NONE
hi Constant              gui=bold guifg=#222222 guibg=NONE
hi Repeat                gui=underline guifg=#222222 guibg=NONE
hi DiffAdd               gui=underline guifg=#222222 guibg=NONE
hi GitGutterAdd          gui=underline guifg=#222222 guibg=NONE
hi cssIncludeKeyword     gui=underline guifg=#222222 guibg=NONE
hi Keyword               gui=bold guifg=#222222 guibg=NONE
hi IncSearch             gui=underline guifg=#333333 guibg=NONE
hi Title                 gui=underline guifg=#333333 guibg=NONE
hi PreCondit             gui=underline guifg=#333333 guibg=NONE
hi Debug                 gui=underline guifg=#333333 guibg=NONE
hi SpecialChar           gui=italic guifg=#333333 guibg=#BBBBBB
"hi SpecialChar           gui=strikethrough guifg=#333333 guibg=NONE

hi Conditional           guifg=#333333 guibg=white gui=bold,italic
hi Todo                  guifg=#333333 guibg=NONE
hi Special               guifg=#333333 guibg=NONE
hi Label                 guifg=#333333 guibg=NONE
hi Delimiter             guifg=#333333 guibg=NONE
hi Number                guifg=#333333 guibg=NONE gui=bold
hi CursorLineNR          guifg=#333333 guibg=NONE
hi Define                guifg=#333333 guibg=NONE
hi MoreMsg               guifg=#333333 guibg=NONE
hi Tag                   guifg=#333333 guibg=NONE
hi String                guifg=#333333 guibg=NONE gui=italic
hi MatchParen            guifg=#333333 guibg=NONE
hi Macro                 guifg=#333333 guibg=NONE gui=underline
hi DiffChange            guifg=#333333 guibg=NONE
hi GitGutterChange       guifg=#333333 guibg=NONE
hi cssColor              guifg=#333333 guibg=NONE
hi Function              guifg=#444444 guibg=#CCCCCC gui=bold
hi Directory             guifg=#555555 guibg=NONE
hi markdownLinkText      guifg=#555555 guibg=NONE
hi javaScriptBoolean     guifg=#555555 guibg=NONE
hi Include               guifg=#555555 guibg=NONE gui=underline
hi Storage               guifg=#555555 guibg=NONE
hi cssClassName          guifg=#555555 guibg=NONE
hi cssClassNameDot       guifg=#555555 guibg=NONE
hi Statement             guifg=#666666 guibg=NONE
hi Operator              guifg=#666666 guibg=NONE
hi cssAttr               guifg=#666666 guibg=NONE


hi Pmenu guifg=#000000 guibg=#cccccc
hi SignColumn guibg=#dadada
hi Title guifg=#000000
hi LineNr guifg=#000000 guibg=#dadada
hi NonText guifg=#aaaaaa guibg=#dadada
hi Comment guifg=#999999 gui=italic
hi SpecialComment guifg=#aaaaaa gui=italic guibg=NONE
hi CursorLine guibg=#cccccc
hi TabLineFill gui=NONE guibg=#cccccc
hi TabLine guifg=#000000 guibg=#cccccc gui=NONE
hi StatusLine gui=bold guibg=#cccccc guifg=#000000
hi StatusLineNC gui=NONE guibg=#dadada guifg=#000000
hi Search guibg=#aaaaaa guifg=#000000
hi VertSplit gui=NONE guifg=#cccccc guibg=NONE
hi Visual gui=NONE guibg=#cccccc
