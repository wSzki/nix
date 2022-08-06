" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    init.vim                                           :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: wsz <marvin@42.fr>                         +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/08/06 08:55:54 by wsz               #+#    #+#              "
"    Updated: 2022/08/06 08:58:05 by wsz              ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" Wilder init
""""""""""""""
function! UpdateRemotePlugins(...)
	let &rtp=&rtp " Needed to refresh runtime files
	UpdateRemotePlugins
endfunction

" PLug call
""""""""""""
call plug#begin('~/.vim/plugged')
" VIM
""""""
Plug 'preservim/nerdcommenter'        " Commenter
Plug 'mg979/vim-visual-multi'         " Multi cursor
Plug 'airblade/vim-gitgutter'         " Git signs
Plug 'thirtythreeforty/lessspace.vim' " Trim spaces
Plug 'ericbn/vim-relativize'          " Relative numbers when needed
Plug 'vim-scripts/restore_view.vim'   " Restore view to last line
Plug 'mbbill/undotree'                " Persistent undo
Plug 'machakann/vim-sandwich'         " {[( surround

Plug 'pandark/42header.vim',     {'on' : 'FortyTwoHeader'}    " 42 header
"Plug 'junegunn/fzf',             {'on' : 'Files'}             " FZF
"Plug 'junegunn/fzf.vim',         {'on' : 'Files'}             " FZF
"Plug 'mileszs/ack.vim',          {'on' : 'Ack'}               " ACK
Plug 'chrisbra/colorizer',       {'on' : 'ColorToggle'}       " HEX Color display
Plug 'junegunn/vim-easy-align',  {'on' : '<Plug>(EasyAlign)'} " Align
Plug 'mhinz/vim-sayonara',       {'on' : 'Sayonara'}          " Quit buffer or tab
Plug 'dstein64/vim-startuptime', {'on' : 'StartupTime'}       " Check startup time
Plug 'akinsho/toggleterm.nvim' , {'on' : 'ToggleTerm'}            " Better split terminal
Plug 'LnL7/vim-nix'

" Disabled
"""""""""""
Plug 'stormherz/tablify',                {'on' : 'DISABLED'} " Generate ascii tables
Plug 'xavierchow/vim-sequence-diagram',  {'on' : 'DISABLED'} " Generate diagrams
Plug 'ryanoasis/vim-devicons',           {'on' : 'DISABLED'} " Original devicons
Plug '/mattn/emmet-vim',                 {'on' : 'DISABLED'} " ? Useful? Coc-emmet is available
Plug 'axlebedev/footprints',             {'on' : 'DISABLED'} " ?
Plug 'octol/vim-cpp-enhanced-highlight', {'on' : 'DISABLED'} " ?
"Plug 'davidgranstrom/scnvim'
"Plug 'supercollider/scvim'
"Plug 'simonhicks/foxdot.vim'
Plug 'tidalcycles/vim-tidal'
Plug 'neovimhaskell/haskell-vim'
Plug 'roxma/nvim-yarp',                  {'on' : 'DISABLED'} " ?
Plug 'roxma/vim-hug-neovim-rpc',         {'on' : 'DISABLED'} " ?
Plug 'vimlab/split-term.vim',            {'on' : 'DISABLED'} " Better split terminal

" Filetype Specific
""""""""""""""""""""
Plug 'mboughaba/i3config.vim',  {'for' : 'i3config'}  " for is broken
Plug 'plasticboy/vim-markdown', {'for' : 'markdown'}  " for is broken
Plug 'bfrg/vim-cpp-modern',     {'for' : ['c','cpp']} " for is broken

" NVIM
"""""""
Plug 'MunifTanjim/nui.nvim'     " Nvim UI library
Plug 'nvim-lua/plenary.nvim'    " Nvim additional functions
Plug 'nacro90/numb.nvim'        " Peek at line search
Plug 'karb94/neoscroll.nvim'    " Smooth scrolling
Plug 'dstein64/nvim-scrollview' " Scrollbar
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'nathom/filetype.nvim' " Unnsure if useful, reduce startup time

Plug 'neoclide/coc.nvim',               {'branch' : 'release'}                       " Completion
Plug 'nvim-treesitter/nvim-treesitter', {'do'     : ':TSUpdate'}                     " Better syntax ?
Plug 'sindrets/diffview.nvim',          {'on'     : 'DiffviewOpen'}                  " Diff view
"Plug 'gelguy/wilder.nvim',              {'do'     : function('UpdateRemotePlugins')} " better wildmenuu
Plug 'gelguy/wilder.nvim',              "better wildmenuu

Plug 'nvim-neo-tree/neo-tree.nvim',     {'on'     : ['NeoTreeFocusToggle', 'NeoTreeFloatToggle']}
Plug 'kyazdani42/nvim-web-devicons'
" WEB DEV
"""""""""
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

" Plug test
""""""""""""

"Plug 'honza/vim-snippets'       " Snippets
"Plug 'lervag/vimtex'
"Plug 'kyazdani42/nvim-web-devicons' " for file icons
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'nvim-telescope/telescope-file-browser.nvim'
"Plug 'nvim-telescope/telescope-media-files.nvim'
""Plug 'lifepillar/vim-colortemplate'
"Plug 'termhn/i3-vim-nav'

" Vim Script
"""""""""""""

"Plug 'puremourning/vimspector'  " Debugger
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

call plug#end()

"#191d20"
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
"#ea6962"
"#EBCB8B"
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
hi String                gui=NONE   guifg=#A3BE8C guibg=NONE
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


if has('persistent_undo')         "check if your vim version supports
	set undodir=$HOME/.undo     "directory where the undo files will be stored
	set undofile                    "turn on the feature
endif

autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()

set encoding=utf-8
set complete-=5
set lazyredraw
set re=1
set timeoutlen=1000
set ttimeoutlen=0
set synmaxcol=400
syntax sync minlines=256
set linebreak
set nowrap

set list
set listchars=space:.,tab:•-,trail:~,extends:>,precedes:<

filetype indent on
filetype plugin on
set autoindent
set cindent
set smartindent

set clipboard=unnamed,unnamedplus
set scrolloff=1000
set noswapfile
set nu
set mouse=a
set relativenumber
set nocursorline
set background=dark
if has ('termguicolors')
	set termguicolors
endif
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction











