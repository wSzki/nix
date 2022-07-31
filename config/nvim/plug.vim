" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    plugs.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: wszurkow <wszurkow@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/02/26 22:46:04 by wszurkow          #+#    #+#              "
"    Updated: 2022/02/26 22:46:05 by wszurkow         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"################################################ "
"### PLUG ###"
"################################################ "

" Auto install
"""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Wilder init
""""""""""""""
function! UpdateRemotePlugins(...)
	" Needed to refresh runtime files
	let &rtp=&rtp
	UpdateRemotePlugins
endfunction

" PLug call
""""""""""""
call plug#begin('~/.vim/plugged')

" Themes
"""""""""
 Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'

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
Plug 'junegunn/fzf',             {'on' : 'Files'}             " FZF
Plug 'junegunn/fzf.vim',         {'on' : 'Files'}             " FZF
Plug 'mileszs/ack.vim',          {'on' : 'Ack'}               " ACK
Plug 'chrisbra/colorizer',       {'on' : 'ColorToggle'}       " HEX Color display
Plug 'junegunn/vim-easy-align',  {'on' : '<Plug>(EasyAlign)'} " Align
Plug 'mhinz/vim-sayonara',       {'on' : 'Sayonara'}          " Quit buffer or tab
Plug 'dstein64/vim-startuptime', {'on' : 'StartupTime'}       " Check startup time
Plug 'akinsho/toggleterm.nvim' , {'on' : 'ToggleTerm'}            " Better split terminal
"Plug 'LnL7/vim-nix'
"Plug 'termhn/i3-vim-nav'

" Disabled
"""""""""""
Plug 'stormherz/tablify',                {'on' : 'DISABLED'} " Generate ascii tables
Plug 'xavierchow/vim-sequence-diagram',  {'on' : 'DISABLED'} " Generate diagrams
Plug 'ryanoasis/vim-devicons',           {'on' : 'DISABLED'} " Original devicons
Plug '/mattn/emmet-vim',                 {'on' : 'DISABLED'} " ? Useful? Coc-emmet is available
Plug 'axlebedev/footprints',             {'on' : 'DISABLED'} " ?
Plug 'octol/vim-cpp-enhanced-highlight', {'on' : 'DISABLED'} " ?
Plug 'davidgranstrom/scnvim'
Plug 'supercollider/scvim'
Plug 'simonhicks/foxdot.vim'
Plug 'tidalcycles/vim-tidal'
Plug 'neovimhaskell/haskell-vim'
Plug 'roxma/nvim-yarp',                  {'on' : 'DISABLED'} " ?
Plug 'roxma/vim-hug-neovim-rpc',         {'on' : 'DISABLED'} " ?
Plug 'vimlab/split-term.vim',            {'on' : 'DISABLED'} " Better split terminal
Plug 'LnL7/vim-nix'

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
Plug 'gelguy/wilder.nvim',              {'do'     : function('UpdateRemotePlugins')} " better wildmenuu

Plug 'nvim-neo-tree/neo-tree.nvim',     {'on'     : ['NeoTreeFocusToggle', 'NeoTreeFloatToggle']}
Plug 'kyazdani42/nvim-web-devicons',    {'on'     : ['NeoTreeFocusToggle', 'NeoTreeFloatToggle']}

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
" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <Leader>pp :lua require'telescope.builtin'.find_files{}

" Vim Script
"""""""""""""

"Plug 'puremourning/vimspector'  " Debugger
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

call plug#end()
