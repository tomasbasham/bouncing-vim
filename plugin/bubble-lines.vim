" ====================
" === Bubble lines ===
" ====================
" http://vimcasts.org/episodes/bubbling-text/
" http://reefpoints.dockyard.com/2013/09/26/vim-moving-lines-aint-hard.html
" " ...single lines
" nmap <C-Up> ddkP
" nmap <C-Down> ddp
" " ...multiple lines
" vmap <C-Up> xkP`[V`]
" vmap <C-Down> xp`[V`]

" Normal mode
" nnoremap <C-Down> :m .+1<CR>==
" nnoremap <C-Up> :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>
nnoremap <C-Up> :m .-2<CR>

" Insert mode
" inoremap <C-Down> <ESC>:m .+1<CR>==gi
" inoremap <C-Up> <ESC>:m .-2<CR>==gi
inoremap <C-Down> <ESC>:m .+1<CR>gi
inoremap <C-Up> <ESC>:m .-2<CR>gi

" Visual mode
" vnoremap <C-Down> :m '>+1<CR>gv=gv
" vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv
vnoremap <C-Up> :m '<-2<CR>gv