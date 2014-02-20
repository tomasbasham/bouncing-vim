" ==================================
" === Autowrite, Backup and Undo ===
" ==================================
" http://albertomiorin.com/blog/2012/12/10/autoread-and-autowrite-in-vim/
" http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost

set hidden " allow switching between buffers with unsaved changes
set nobackup
set noswapfile
set nowritebackup

" Auto-reload buffers when file changed on disk (does not always work in reality)
set autoread
" Save all buffers when switching between them, to avoid running tests
" with unsaved changes.
set autowrite
autocmd BufLeave,FocusLost * wall

" ==========================
" === Save with shortcut ===
" ==========================
"
" Save, but only if the buffer is modified.
" <http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files>
" In insert mode: stay in normal mode after saving
inoremap <C-s> <esc>:wall<cr>
nnoremap <C-s> :wall<cr>

" === NOTE: Support for CTRL-S and CTRL-Q in the terminal ===
"
" Normally CTRL-S and CTRL-Q suspend and wake up the terminal output in
" terminal emulators (respectively freezing and unfreezing).
" Put this function in the .bashrc to allow instead passing the key combo
" through to vim.
"
" vim() {
"   local STTYOPTS="$(stty --save)"
"   stty stop '' -ixoff # pass CTRL-S
"   stty start '' -ixon # pass CTRL-Q
"   command vim "$@"
"   stty "$STTYOPTS"
" }
