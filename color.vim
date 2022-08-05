
let bisou = "#191d20"
"#262727
"#191d20
"#3c3836
"#3c3836
"#504945
"#1f2428
"#32302f
"#504945
"#32361a
"#333e34
"#3c1f1e
"#442e2d
"#0d3138
"#2e3b3b
"#473c29
"#32302f
"#d4be98
"#ddc7a1
let s:red = "#ea6962"
let _ylw_light = "#EBCB8B"
"#d8a657
"#A3BE8C
"#D08770
"#7C9C90
"#e78a4e
"#ea6962
"#a9b665
"#d8a657
"#7c6f64
"#928374
"#a89984
"
hi clear
syntax reset
let g:colors_name = "my-scheme"
set background=dark
set t_Co=256
hi Normal guifg=#d4be98 ctermbg=NONE guibg=#191d20 gui=NONE

hi CocMenuSel          gui=NONE      ctermbg=11    guibg=#191d20
hi CocFloating         gui=NONE      guibg=#191d20
hi CocErrorSign        gui=NONE      guifg=#d1666a guibg=NONE
hi CocInfoSign         gui=NONE      guifg=NONE    guibg=#353b45
hi CocWarningSign      gui=NONE      guifg=._ylw_light guibg=NONE
hi CocErrorFloat       ctermfg=11

hi CocErrorHighlight   gui=undercurl guisp=#ea6962
hi CocWarningHighlight gui=undercurl guisp=#fabd2f

hi DiffText              gui=NONE   guifg=#7C9C90 guibg=NONE
hi ErrorMsg              gui=NONE   guifg=#7C9C90 guibg=NONE
hi WarningMsg            gui=NONE   guifg=#7C9C90 guibg=NONE
hi PreProc               gui=NONE   guifg=#7C9C90 guibg=NONE
hi Exception             gui=NONE   guifg=#7C9C90 guibg=NONE
hi Error                 gui=NONE   guifg=#7C9C90 guibg=NONE
hi DiffDelete            gui=NONE   guifg=#7C9C90 guibg=NONE
hi GitGutterDelete       gui=NONE   guifg=#7C9C90 guibg=NONE
hi GitGutterChangeDelete gui=NONE   guifg=#7C9C90 guibg=NONE
hi cssIdentifier         gui=NONE   guifg=#7C9C90 guibg=NONE
hi cssImportant          gui=NONE   guifg=#7C9C90 guibg=NONE
hi Type                  gui=NONE   guifg=#d8a657 guibg=NONE
hi Identifier            gui=NONE   guifg=#7C9C90 guibg=NONE
hi PMenuSel              gui=NONE   guifg=#D08770 guibg=NONE
hi Constant              gui=NONE   guifg=#D08770 guibg=NONE
hi Repeat                gui=NONE   guifg=#D08770 guibg=NONE
hi DiffAdd               gui=NONE   guifg=#D08770 guibg=NONE
hi GitGutterAdd          gui=NONE   guifg=#D08770 guibg=NONE
hi cssIncludeKeyword     gui=NONE   guifg=#D08770 guibg=NONE
hi Keyword               gui=NONE   guifg=#D08770 guibg=NONE
hi IncSearch             gui=NONE   guifg=#EBCB8B guibg=NONE
hi Title                 gui=NONE   guifg=#EBCB8B guibg=NONE
hi PreCondit             gui=NONE   guifg=#EBCB8B guibg=NONE
hi Debug                 gui=NONE   guifg=#EBCB8B guibg=NONE
hi SpecialChar           gui=NONE   guifg=#EBCB8B guibg=NONE
hi Conditional           gui=NONE   guifg=#D08770 guibg=NONE
hi Todo                  gui=NONE   guifg=#EBCB8B guibg=NONE
hi Special               gui=NONE   guifg=#EBCB8B guibg=NONE
hi Label                 gui=NONE   guifg=#EBCB8B guibg=NONE
hi Delimiter             gui=NONE   guifg=#EBCB8B guibg=NONE
hi Number                gui=NONE   guifg=#EBCB8B guibg=NONE
hi CursorLineNR          gui=NONE   guifg=#EBCB8B guibg=NONE
hi Define                gui=NONE   guifg=#EBCB8B guibg=NONE
hi MoreMsg               gui=NONE   guifg=#EBCB8B guibg=NONE
hi Tag                   gui=NONE   guifg=#EBCB8B guibg=NONE
hi String                gui=NONE   guifg=#EBCB8B guibg=NONE
hi MatchParen            gui=NONE   guifg=#EBCB8B guibg=NONE
hi Macro                 gui=NONE   guifg=#EBCB8B guibg=NONE
hi DiffChange            gui=NONE   guifg=#EBCB8B guibg=NONE
hi GitGutterChange       gui=NONE   guifg=#EBCB8B guibg=NONE
hi cssColor              gui=NONE   guifg=#EBCB8B guibg=NONE
hi Function              gui=NONE   guifg=#7C9C90 guibg=NONE
hi Directory             gui=NONE   guifg=#e78a4e guibg=NONE
hi markdownLinkText      gui=NONE   guifg=#e78a4e guibg=NONE
hi javaScriptBoolean     gui=NONE   guifg=#e78a4e guibg=NONE
hi Include               gui=NONE   guifg=#e78a4e guibg=NONE
hi Storage               gui=NONE   guifg=#e78a4e guibg=NONE
hi cssClassName          gui=NONE   guifg=#e78a4e guibg=NONE
hi cssClassNameDot       gui=NONE   guifg=#e78a4e guibg=NONE
hi Statement             gui=NONE   guifg=#ea6962 guibg=NONE
hi Operator              gui=NONE   guifg=#ea6962 guibg=NONE
hi cssAttr               gui=NONE   guifg=#ea6962 guibg=NONE
hi Pmenu                 gui=NONE   guifg=#dadada guibg=#454545
hi SignColumn            gui=NONE   guifg=NONE    guibg=#191d20
hi Title                 gui=NONE   guifg=#dadada guibg=NONE
hi LineNr                gui=NONE   guifg=#504945 guibg=#191d20
hi NonText               gui=NONE   guifg=#70665c guibg=#191d20
hi Comment               gui=NONE   guifg=#70665c gui=italic
hi SpecialComment        gui=italic guifg=#c481ff guibg=NONE
hi CursorLine            gui=NONE   guifg=NONE    guibg=#454545
hi TabLineFill           gui=NONE   guifg=NONE    guibg=#454545
hi TabLine               gui=NONE   guifg=#747474 guibg=#454545
hi StatusLine            gui=bold   guibg=#454545 guifg=#dadada
hi StatusLineNC          gui=NONE   guibg=#272935 guifg=#dadada
hi Search                gui=NONE   guibg=#c481ff guifg=#dadada
hi VertSplit             gui=NONE   guifg=#454545 guibg=NONE
hi Visual                gui=NONE   guifg=NONE    guibg=#454545
