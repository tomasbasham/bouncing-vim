" Mouse
" <http://usevim.com/2012/05/16/mouse/>
set ttyfast          " Send more characters for redraws (faster scrolling)
set mouse=a          " Enable mouse use in all modes
let is_neovim=matchstr($VIMRUNTIME, '\<nvim\>')
if is_neovim == ""
  set ttymouse=xterm2  " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
endif
set mousehide        " Hide mouse pointer while typing
set mousemodel=popup
