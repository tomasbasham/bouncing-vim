" Credits: originally based on https://github.com/DawidJanczak/.vim/blob/master/.vimrc

" ==============
" === Basics ===
" ==============

set nocompatible " with VI
set nomodeline " Ignore vim directives in magic comments

" ==================
" === Leader key ===
" ==================
" <http://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader>
" http://stackoverflow.com/questions/8395531/how-do-i-map-multiple-leader-keys-in-vim
"
" Map leader key to the customary comma without overriding it
nmap , \
vmap , \

" =======================
" === Misc keybinding ===
" =======================

" Insert line below or above without going into insert mode.
" ----------------------------------------------------------
" <http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode>
" The idea of using `oo` and `OO` is nice in theory, but slows down the normal
" `o` and `O`.
" CTRL-O and CTRL-I are native Vim keybindings to move through the jumplist.
" Leader-O and Leader-I are less convenient to type, and require to release
" the leader to repeat the command. This is not a strong argument though,
" because having multiple blank lines is considered bad form, and being
" able to insert one should be enough.
" On top of this, no keycode fix seems to be possible for Mac, since ALT-I
" doesn't correspond to any character.
" These mappings are therefore experimental and likely to change.
nnoremap <Leader>o mao<Esc>`a
nnoremap <Leader>i maO<Esc>`a

" Fix keycodes and map ALT-O and ALT-I to add new line below/above without
" going in insert mode.
map o <M-o>
noremap <M-o> mao<Esc>`a

map i <M-i>
noremap <M-i> maO<Esc>`a

" Remap F1 key
" ------------
" Map F1 key (main vim help) to ESC to avoid bringing it up by mistake.
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap <F1> <ESC>

" Alternative Escape
" ------------------
" Go from insert mode to normal mode with 'jj', 'jk' or 'kj'.
" While possible, defining this mapping in visual mode is not done because it
" would interphere with the navigation keys.
" 'jk' is included, but it could prevent you from quickly typing 'Dijkstra'
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" Toggle spell checking
" ---------------------
" toggle spell checking with <F6>
nnoremap <F6> :setlocal spell!<CR>
vnoremap <F6> :setlocal spell!<CR>
inoremap <F6> <Esc>:setlocal spell!<CR>

" Disable ex-mode keybinding
" --------------------------
"
" Remap Q in normal mode to no-op to avoid bringing up ex-mode accidentally.
nnoremap Q <Nop>

" ====================
" === Misc options ===
" ====================

" reduce the command timeout
" --------------------------
" (default 1000)
set timeoutlen=350

" Use 2-space soft tabs by defaults
" ---------------------------------
" (it's overriden for some some languages with different conventions).
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Enable omni-completion
" ----------------------
" <http://vim.wikia.com/wiki/Omni_completion>
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" ======================
" === Format options ===
" ======================

set pastetoggle=<F3> " disable auto format when pasting from system clipboard

" Delete comment leader when joining lines using J
if version >= 704
  set formatoptions+=j
endif

" Only one space after punctuation:
" http://en.wikipedia.org/wiki/Sentence_spacing#Typography
set nojoinspaces

" Align wrapped lines with the original indentation
if version >= 704
  try
    set breakindent
    runtime bundle/ack.vim/plugin/ack.vim
  catch
  endtry
endif

" ================================
" === Create path for new file ===
" ================================

" http://stackoverflow.com/questions/10394707/create-file-inside-new-directory-in-vim-in-one-step/10397159#10397159
" You can also use `<C-y>` once you are in CtrlP.

function s:MKDir(...)
  if !a:0
        \|| isdirectory(a:1)
        \|| filereadable(a:1)
        \|| isdirectory(fnamemodify(a:1, ':p:h'))
    return
  endif
  return mkdir(fnamemodify(a:1, ':p:h'), 'p')
endfunction
command -bang -bar -nargs=? -complete=file EP :call s:MKDir(<f-args>) | e<bang> <args>

" =============
" === CtrlP ===
" =============

" Taken from CtrlP documentation
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.*(git|hg|svn|bundle|bin|bbin)$',
  \ 'file': '\v\.(exe|so|dll|class|pyc)$',
  \ }
  " \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',

" ===========
" === Ack ===
" ===========
" Highlight the searched term.
let g:ackhighlight = 1
" launch ack without argument with leader+a
nnoremap <Leader>a :Ack!<space>

" Use the silver searcher if available.
"
" Check if already defined, so that it's possible to further customise it
" in the vimrc.
" http://usevim.com/2013/10/16/ag/
"
" Always ignore log dir and tags file.
"
if executable('ack')
  let g:ackprg = 'ack -s -H --nocolor --nogroup --column --ignore-dir=log --ignore-file=match:/.*\.?tags/'
endif

if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --ignore={log,tags}'
endif

" Ack needs to be initialised after it's options have been set, if there is no
" ackprg and no ack executable, the ack plugin won't be loaded at all.
if !exists(":Ack")
  try
    runtime bundle/ack.vim/plugin/ack.vim
  catch
    " Although if everything has been installed correctly this should never
    " happen.
  endtry
endif

" ================
" === NERDTree ===
" ================
" Shortcut to open/close NERDTree
map <Leader>n :NERDTreeToggle<CR>
" Highlight the current buffer (think of 'find')
map <Leader>f :NERDTreeFind<CR>
" http://superuser.com/questions/184844/hide-certain-files-in-nerdtree
let NERDTreeIgnore = ['\.pyc$', '\.class$']
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1 " remove buffer when file is deleted/moved
" let NERDTreeMouseMode=2 " single click to toggle dirs, dblclick to open files
" let NERDTreeQuitOnOpen=1 " avoid clutter, close NERDTree after opening a file

" Prevent NERDTree from opening a new split-window
" <http://stackoverflow.com/questions/8323666/make-nerdtree-never-open-a-third-window>
" If the last focused buffer is modified and unsaved, it will still open a new split
set buftype=

" ==========================
" === vimux - vim + tmux ===
" ==========================

" Requires vim compiled with ruby support.

" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>rr :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>ri :VimuxInspectRunner<CR>
" Close all other tmux panes in current window
map <Leader>rx :VimuxClosePanes<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>rq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>rs :VimuxInterruptRunner<CR>

" ================
" === vim-ruby ===
" ================

" Highlight ruby operators (`/`, `&&`, `*`...)
let g:ruby_operators = 1

" ==================================
" === Language specific settings ===
" ==================================

" --- Java
autocmd FileType java setlocal ts=4 sts=4 sw=4

" --- Python
" autocmd FileType python setlocal ts=4 sts=4 sw=4
" autocmd FileType python setlocal foldmethod=indent " it works pretty badly anyway

" --- Go
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab

" ======================
" === ruby xmpfilter ===
" ======================

" Gvim
nmap <buffer> <M-r> <Plug>(xmpfilter-run)
xmap <buffer> <M-r> <Plug>(xmpfilter-run)
imap <buffer> <M-r> <Plug>(xmpfilter-run)

nmap <buffer> <M-m> <Plug>(xmpfilter-mark)
xmap <buffer> <M-m> <Plug>(xmpfilter-mark)
imap <buffer> <M-m> <Plug>(xmpfilter-mark)

" Terminal
nmap <buffer> <F5> <Plug>(xmpfilter-run)
xmap <buffer> <F5> <Plug>(xmpfilter-run)
imap <buffer> <F5> <Plug>(xmpfilter-run)

nmap <buffer> <F4> <Plug>(xmpfilter-mark)
xmap <buffer> <F4> <Plug>(xmpfilter-mark)
imap <buffer> <F4> <Plug>(xmpfilter-mark)

" ==========================
" === tpope/vim-markdown ===
" ==========================
"
" Enable language-specific code
" <https://coderwall.com/p/ftqcla>
let g:markdown_fenced_languages = [
\ 'coffee',
\ 'css',
\ 'erb=eruby',
\ 'javascript',
\ 'js=javascript',
\ 'json=javascript',
\ 'ruby',
\ 'sass',
\ 'xml',
\ 'sh',
\ 'yaml',
\ 'go',
\ 'sql'
\]

" ====================
" === fatih/vim-go ===
" ====================
"
" Vim plugin for golang.
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "ultisnips"

" ===============================
" === Filetype customizations ===
" ===============================

" http://beerpla.net/2008/04/02/how-to-add-a-vim-file-extension-to-syntax-highlighting/
syntax enable
filetype on
au BufNewFile,BufRead *.txt set filetype=markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.erb set filetype=eruby.html
" Set filetype for specific names: <http://dailyvim.tumblr.com/post/1262764095/additional-ruby-syntax-highlighting>
autocmd BufRead,BufNewFile {Capfile,Gemfile,Rakefile,config.ru,.caprc,.irbrc,irb_tempfile*,.pryrc,Vagrantfile} set filetype=ruby
autocmd BufRead,BufNewFile {*bash_aliases} set filetype=sh
" It shouldn't be needed with the mustache.vim plugin
" au BufNewFile,BufRead *.mustache set filetype=html

" ==================================
" === Colors for MiniBufExplorer ===
" ==================================

" Custom colors for buffers...
" ...NOT CHANGED and NOT VISIBLE
autocmd ColorScheme * highlight MBENormal ctermfg=14
" ...CHANGED and NOT VISIBLE
autocmd ColorScheme * highlight MBEChanged ctermfg=14
" ...NOT CHANGED and VISIBLE
autocmd ColorScheme * highlight MBEVisibleNormal ctermfg=14
" ...CHANGED and VISIBLE
autocmd ColorScheme * highlight MBEVisibleChanged ctermfg=14
" ...NOT CHANGED, VISIBLE and ACTIVE
autocmd ColorScheme * highlight MBEVisibleActiveNormal ctermfg=0
" ...CHANGED, VISIBLE and ACTIVE
autocmd ColorScheme * highlight MBEVisibleActiveChanged ctermfg=0
