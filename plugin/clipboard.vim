" =====================================
" === Yank till the end of the line ===
" =====================================

" This was removed from vim-sensible.
" Make Y consistent with C and D. See :help Y.
nnoremap Y y$

" ================================
" === Copy to system clipboard ===
" ================================

" This is nice because gives best of both worlds.
"
" <http://devinvenable.blogspot.co.uk/2009/12/save-with-ctrl-s-using-vim-and.html>
" <http://vim.wikia.com/wiki/Accessing_the_system_clipboard>
"
" Requires that Vim has been compiled with clipboard and X11 support.
vnoremap <C-c> "+y

" The corresponding setting for pasting is not needed because normally
" already supported by the terminal, and it would be difficult to find a
" sensible keybinding that doesn't conflict with existing ones.
"
" Alternatively, it's also possible to always use the system clipboard
" by default: http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" set clipboard=unnamedplus
"
" For Mac users requires additional configuration:
" https://coderwall.com/p/j9wnfw

" NOTE: TMUX SUPPORT
" ------------------
" To enable system clipboard in tmux as well:
" # http://blog.sanctum.geek.nz/vi-mode-in-tmux/
" # http://www.drbunsen.org/the-text-triumvirate/#tmux
" set-window-option -g mode-keys vi
" bind-key -t vi-copy 'v' begin-selection
" # bind-key -t vi-copy 'y' copy-selection
" # http://robots.thoughtbot.com/post/55885045171/tmux-copy-paste-on-os-x-a-better-future
" bind-key -t vi-copy 'y' copy-pipe "xsel --clipboard --input"
" # bind-key -t vi-copy 'p' paste-buffer
" unbind p
" bind p paste-buffer
"
" # give 'v' to the user that still needs to go to the previous buffer
" bind v previous-window

" =============================
" === Paste without yanking ===
" =============================

" In visual mode, replace currently selected text with default register
" without yanking it.
" Modified from <http://stackoverflow.com/a/920139> to account for end of line
" original version: vnoremap <Leader>p "_dP
" See also <http://stackoverflow.com/questions/11176159/vim-go-to-start-end-of-visual-selection/11176286#11176286>.
" Requires that the leader is mapped non-ambiguously, `map , = \` does not work.
vnoremap <Leader>p pgvy`>
" p   -> paste normally
" gv  -> reselect the pasted text
" y   -> copy it again
" `>  -> jump to the last character of the visual selection (built-in mark)
