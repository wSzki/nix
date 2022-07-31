" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    init.vim                                           :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: wszurkow <wszurkow@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2020/09/29 17:22:42 by wszurkow          #+#    #+#              "
"    Updated: 2022/02/26 22:51:05 by wszurkow         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

set runtimepath^=~/.vim
set runtimepath+=~/.vim/after

let $dir_dotfiles = '~/.config/nvim'

let g:sclang_executable_path = "/usr/bin/sclang"
let g:python_executable_path = "/usr/bin/python3"


source $dir_dotfiles/plug.vim
source $dir_dotfiles/plug_settings.vim
source $dir_dotfiles/plug_settings.lua

source $dir_dotfiles/syntax.vim
source $dir_dotfiles/setters.vim
source $dir_dotfiles/mappings.vim

command!  PYNVIM   :!python3 -m pip install --user --upgrade pynvim

command! COCSETUP  :CocInstall coc-diagnostic coc-explorer coc-clangd coc-cmake            coc-fzf coc-sh     coc-snippets coc-yank coc-symbol-line
command! COCWEB    :CocInstall coc-emmet      coc-css      coc-html   coc-html-css-support coc-svg coc-eslint coc-tsserver coc-json coc-tslint-plugin coc-tailwindcss

command! COCDOCKER :CocInstall coc-docker

" LINK VIMRC to NVIMRC > ~/.config/nvim/init.vim
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
"

let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }





lua << EOF
require('scnvim').setup()
EOF
