To do

no doubt

* ci //
* ci ||
* add nerd bar
* add leader-r mapping for most recently used buffers
* check for tmux version when setting the mouse
* make window name stand out if the exit code
* <http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE>
* <https://www.reddit.com/r/tmux/comments/3paqoi/tmux_21_has_been_released/>
* NerdTree preview: <http://stackoverflow.com/a/28407909>
* investigate issue with syntastic + capybara
* fix the ./install/full-noprompt when running from a location that is not ~/.vim/bundle/bouncing-vim
* add a global configuration option to enable the "strip multiple blank lines" in bouncing vim itself
* update solarized style for different types of spelling errors
* update solarized for inline code (backticks)
* add the ability to `:ci|`, `:ci/`, `:ci\`
* add shortcut to revert selected lines, not the whole file, http://superuser.com/a/603216
  but does not work in Windows; for portable solution :help 12.4
    :%!tail -r
    :'<,'>!tail -r
* copy lines with number increment
* add shortcut to enter current date, and current timestamp
* add shortcut to underline current line with different characters
* fix moving rows when at the ends of the buffer
* override more Agnostic highlight groups, particularly, make comments less prominent than normal text, instead of the other way around
* pass the name of the database to the <C-t> command, and save it until the end of the session
* handle the counter-intuitive /g option in substitution more correctly
* consider renaming to bouncing-tim or bouncing-vimux, or dream-tim to express
  the idea of tight integration with tmux
* fix agnostic FIXME comment highlighting
* remove the vimrc entirely
* disable plugin specific configuration if the plugin is not installed
* find a way to enable rails syntax highlighting manually
* close quickfix list with escape
* highlight searching without moving <http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches#Highlight_matches_without_moving>
* make an "agnostic" version of solarized
* add html beautifying <http://vim.wikia.com/wiki/Cleanup_your_HTML>
    :command Thtml :%!tidy -q -i --show-errors 0
    :command Txml  :%!tidy -q -i --show-errors 0 -xml
* use tabs for makefiles
* make a PR for commentary about line comments in SQL
* add join command with no spaces
* add syntastic and make sure it's possible to turn it on and off with a shortcut
* tmux conf: move the hostname to the left and make the colour more prominent
* fuzzy search within buffer
  - -> replace CtrlP with <https://github.com/Shougo/unite.vim>?
  - <http://superuser.com/questions/390011/fuzzy-find-within-file-in-vim/445206#445206>
* global search and replace
* ctrl-p -> check why it does not give precedence to matches in the file name
* conflict ctrl-space with emacs (to set the point)
* print list of the plugins that are going to be installed with the guided install
* add info about the colours to the readme
* use proper version checking for breakindent when vim 7.5 is released
* add scripts for gnome-terminal profiles
* post a reply about the issue for ALT modifier not working on Mac terminals
* add open in split to git grep
* merge `clone_to_bundle_with_home` into `install_plugin_with_pathogen`
* re-enable vim directives in the files
* add current word search to the grep helpers
* add shortcut for global search and replace
* reinstate unobtrusive handling of the folding
* put the prefix for the temporary install in a variable (config.sh)
* Add Q&A section to the readme:
  - how is bouncing-vim different from, say, janus?
  - merge the part about pathogen, and who is this for...
* toggling lines C-n conflicts with multi-edit plugin
* add shortcut to remove extra blank lines in the middle of the buffer

Unite notes

* file fuzzy search order -> selecta (<https://github.com/Shougo/unite.vim/issues/495>)
* <http://mouki.io/2013/08/15/Vim-CtrlP-behaviour-with-Unite.html>
* <http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html>
* <http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/>

not so much

* use cmd c/s on mac, is it even possible?
* in case of issues with agnostic take a look at <http://www.terminally-incoherent.com/blog/2012/10/17/vim-solarized-and-tmux/>
* underline current line: <http://www.vimbits.com/bits/12>, `:t. | s/./-/ | nohl`
* investigate fuzzy in-buffer search
* change the installation so that it moves existing vimrc to vimrc.after
* consider add moving text inside the line, and comma separate elements
* add command for rotating vertical <-> horizontal splits
* convert string to symbol and viceversa
* consider auto-correction
* more statusline options: <http://got-ravings.blogspot.co.uk/2008/08/vim-pr0n-making-statuslines-that-own.html>
* for plugins that end in ".vim" also check the presence of the folder without ".vim"
* fix or remove leader not working in insert mode
* toggle between `{}` and `do`-`end`
* source bashrc after updating it <http://stackoverflow.com/questions/16011245/source-files-in-a-bash-script/16011496#16011496>
* investigate if smooth scrolling is viable/popular...
  - <http://stackoverflow.com/questions/4064651/what-is-the-best-way-to-do-smooth-scrolling-in-vim/12201974#12201974>
  - <https://github.com/Kazark/vim-SimpleSmoothScroll>
  - <https://github.com/terryma/vim-smooth-scroll>
  - <https://github.com/yonchu/accelerated-smooth-scroll>
  - <http://vim.wikia.com/wiki/Page_up/down_and_keep_cursor_position>
* fix molokai theme making difficult doing spell checking because of the current line highlight
* consider the ruby block text-object plugin
* <http://stackoverflow.com/a/1269631/417375>
* Gary Bernhardt rspec tests execution
* either remove or fix autoreload <http://stackoverflow.com/a/10962191>
* re-hardwrap paragraphs of text: nnoremap `<leader>q gqip`
* select inside and around pipe chars; see also
  - <http://vim.wikia.com/wiki/Creating_new_text_objects>
  - <http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/>
  the problem is that pipe is a command to "go to column..."
* keybindings to toggle the following options, when performance is an issue
  - :set nocursorline/:NoMatchParen <=> :set cursorline/:DoMatchParen
  - let loaded_matchparen = 1, to avoid loading the parantheses matching built-in plugin
* keybindings for activating/deactivating the automatic line hard wrapping (reflow)
* join lines in insert mode (not sure it's a good idea)
* join lines without extra space
* map `<End>` to toggle to the last non-blank char in the line

Other interesting colorschemes
------------------------------

* <https://github.com/romainl/flattened>
* <https://github.com/vim-scripts/AtelierDune> (<https://github.com/atelierbram/syntax-highlighting>)
* `wget https://raw.github.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim -P ~/.vim/colors/`
* <https://github.com/tpope/vim-vividchalk>
* <https://github.com/Lokaltog/vim-distinguished>
* <https://github.com/noahfrederick/Hemisu>
* <https://github.com/morhetz/gruvbox>
* <https://github.com/nanotech/jellybeans.vim>
* <https://github.com/h3rald/stash/blob/master/.vim/colors/herald.vim>
* <http://jeetworks.org/mayansmoke/> light background
* <https://github.com/toupeira/vim-desertink>
* <https://github.com/reedes/vim-colors-pencil>

Other interesting plugins
-------------------------

* <https://github.com/airblade/vim-gitgutter> (feature request)
* good vimrc configuration <http://vim.wikia.com/wiki/Example_vimrc>
* great vimrc configuration <https://github.com/skwp/dotfiles>
* <https://github.com/rhysd/vim-operator-surround>
* <http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/>
* <http://items.sjbach.com/319>
* <http://net.tutsplus.com/articles/general/top-10-pitfalls-when-switching-to-vim/>
* <http://sourceforge.net/projects/vim-taglist/files/latest/download?source=files>
* <http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines>
* <https://github.com/DawidJanczak/.vim/blob/master/.vimrc>
* <https://github.com/bryankennedy/vimrc/blob/master/vimrc>
* <https://github.com/christoomey/vim-tmux-navigator>
* <https://github.com/henrik/dotfiles>
* <https://github.com/jeffkreeftmeijer/vim-numbertoggle>
* <https://github.com/jistr/vim-nerdtree-tabs>
* <https://github.com/junegunn/vimfiles/blob/master/.vimrc>
* <https://github.com/michaeljsmith/vim-indent-object>
* <https://github.com/mislav/vimfiles>
* <https://github.com/nelstrom/vim-textobj-rubyblock>
* <https://github.com/plasticboy/vim-markdown>
* <https://github.com/prognostikos/dotfiles/blob/master/vim/vimrc.symlink> (from Ruby Rogues Parley)
* <https://github.com/r00k/dotfiles/blob/master/vimrc> (Ben Orenstein)
* <https://github.com/suan/vim-instant-markdown>
* <https://github.com/terryma/vim-expand-region>
* <https://github.com/terryma/vim-multiple-cursors>
* <https://github.com/tomtom/tcomment_vim>
* <ssh://hg@bitbucket.org/ns9tks/vim-fuzzyfinder>
* <https://github.com/gerw/vim-HiLinkTrace.git> to get syntax highlight style

Interesting tmux configurations
-------------------------------

* <http://tonkersten.com/2011/07/104-switching-to-tmux/>
- <http://zanshin.net/2013/09/05/my-tmux-configuration/>
- <https://github.com/chrishunt/dot-files/blob/master/.tmux.conf>
