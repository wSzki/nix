" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    mappings.vim                                       :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: wszurkow <wszurkow@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/02/27 14:49:51 by wszurkow          #+#    #+#              "
"    Updated: 2022/02/27 14:49:51 by wszurkow         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "


"################################################ "
" ### MAPPINGS ####
"################################################ "

nnoremap ; :
vnoremap ; :
inoremap <C-Space> <C-]>
" Indent and center
noremap <Leader>n :!norminette %<CR>

map gg gg=G''zz ml:execute 'match Search /\%'.line('.').'l/'<CR>


" Go to file under cursor
map gf :Ack<CR>q

" Surround
map ( saiw(
"))
map { saiw{
map [ saiw[

"map ]] zfa}
map <TAB><TAB> za

" Reload and PlugInstall
noremap <Leader>wso :w <CR>:so %<CR>:PlugInstall<CR><ESC>
noremap <Leader>o :silent execute '!kitty & disown'<CR><ESC>
"noremap <Leader>ack :Ack<CR>q

" Toggle relative number
nmap <f11> :windo set relativenumber!<CR>

" Search - Espace with ENTER
nnoremap <CR> :match<CR>:noh<CR>
"inoremap <ESC> <ESC><ESC>

" Write
nnoremap <C-s> <ESC><ESC><ESC>:w<CR><ESC>
inoremap <C-s> <ESC><ESC><ESC>:w<CR><ESC>i

" Split navigation
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left>  <c-w>h
nnoremap <silent> <C-Up>    <c-w>k
nnoremap <silent> <C-Down>  <c-w>j
"nnoremap <silent> <C-Right> :call Focus('right', 'l')<CR>
"nnoremap <silent> <c-Left> :call Focus('left', 'h')<CR>
"nnoremap <silent> <c-Up> :call Focus('up', 'k')<CR>
"nnoremap <silent> <c-Down> :call Focus('down', 'j')<CR>

nnoremap <silent> <C-g>  :DiffviewOpen<CR>:DiffviewToggleFiles<CR>
nnoremap <silent> <C-h>  :DiffviewClose<CR>

"open term
"nnoremap <Leader>t    :20Term<CR>
"nnoremap <Leader>T    :VTerm<CR>
nnoremap <silent><Leader>t <Cmd>exe v:count1 . "ToggleTerm height=20 direction=horizontal"<CR>
nnoremap <silent><Leader>T <Cmd>exe v:count1 . "ToggleTerm height=20 direction=float"<CR>



" Remap visual block
nnoremap <C-e> <C-q>

" Quit
nnoremap <C-q> <ESC><ESC>:Sayonara<CR>
inoremap <C-q> <ESC><ESC>:Sayonora<CR>

" Buffer select
nnoremap <C-PageUp> :bp<CR>
nnoremap <C-PageDown> :bn<CR>
inoremap <C-PageUp> <ESC><ESC>:bp<CR>
inoremap <C-PageDown> <ESC><ESC>:bn<CR>

noremap <Leader>tree <C-p>


"source ~/.dot/vim/supercollider.vim
"let g:vimspector_enable_mappings = 'HUMAN'

