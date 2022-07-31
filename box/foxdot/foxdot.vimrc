
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after

"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let g:highlightedyank_highlight_duration = 1000

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


set linebreak
set ruler
set nowrap
set tabstop=4
set shiftwidth=4
set breakindent
set breakindentopt=shift:2
set showbreak=↳
set cursorline
set autoindent
set cindent
set smartindent
set list
set listchars=space:.,tab:•-,trail:~,extends:>,precedes:<
set mouse=a
set splitright
set clipboard^=unnamed,unnamedplus
set scrolloff=5
set relativenumber
set laststatus=2
set background=dark
set history=1000
set noswapfile
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=20
set autochdir
syn on
set nocompatible
set backspace=indent,eol,start
set scrolloff=5
set noswapfile
set foldmethod=syntax
set encoding=utf-8
set complete-=5
set lazyredraw
set re=1
set timeoutlen=1000
set ttimeoutlen=0
set synmaxcol=400
syntax sync minlines=256
if has('termguicolors')
	set termguicolors
endif


nmap <C-e> :FoxDotEval<CR>
vnoremap <C-e> :FoxDotEval<CR>
vmap <C-e> :FoxDotEval<CR>
inoremap <C-e> <Esc>:FoxDotEval<CR>i<Right>
imap <C-e> <Esc>:FoxDotEval<CR>i<Right>
map <C-e> :FoxDotEval<CR>


if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif



let g:sclang_executable_path = "/usr/bin/sclang"
let g:python_executable_path = "/usr/bin/python3"

call plug#begin('~/.vim/plugged')
Plug 'machakann/vim-highlightedyank'
Plug 'simonhicks/foxdot.vim'
Plug 'logico/typewriter-vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'koron/vim-monochromenote'
Plug 'YorickPeterse/vim-paper'
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'nikolvs/vim-sunbather'
Plug 'chriskempson/base16-vim'
Plug 'supercollider/scvim'
Plug 'preservim/nerdcommenter'        " Commenter
Plug 'junegunn/vim-easy-align',  {'on' : '<Plug>(EasyAlign)'} " Align
Plug 'maxboisvert/vim-simple-complete'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_theme                        = 'gruvbox'
set background=dark " or light if you want light mode
colorscheme gruvbox8_hard
