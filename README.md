What is it?
-----------

bouncing.vim is a mini Vim distro (collection of plugins and settings),
integrated with tmux, that...

* provides a practical, "human" Vim setup, to make pairing easy and efficient
* provides additional features and shortcuts...
* ...but tries not to remove or override native Vim features and popular setups

### Why [pathogen.vim](https://github.com/tpope/vim-pathogen)?

It uses [pathogen.vim](https://github.com/tpope/vim-pathogen), because pathogen
is "file system-driven", which unlike other loading tools does not require to
modify any file to add more vim plugins.

This has two practical advantages:

* if you are already using pathogen, this distro can be considered an extension
  of your existing setup

* if someone is pairing with you and would like to use bouncing-vim only
  for the pairing session, it can easily installed and removed with a couple
  of commands

### Credits and license

Credits are given in the form of links to the original source.
Third party plugins of course are copyright of the authors, see the links
to the github projects.
Thanks to the great Vim community and to the many authors of the features.

For the scripts, the few original solutions (identified by no link to source)
and the added value of the mashup: see LICENSE.txt

Installing
----------

### Guided install

Install all the plugins (including the nice-to-have's) with: `./install/full`.

Install the essential plugins with: `./install/essential`.

In both cases you will be prompted for choices.

Using the provided rc files is recommended, to get the most out of the
integration between vim and tmux. The original files will be backed
up if present.

If you use the provided `.vimrc` and you want to further customize the
configuration (the colorscheme for example), please put it in `~/.vimrc.after`,
which will be loaded automatically.

If you don't want to use the provided `.tmux.conf`, it's recommended that you
copy the recommended section into your own `.tmux.conf`.

### Fast install

If you are happy with the defaults and want to install without prompts, use
`./install/full-noprompt` or `./install/essential-noprompt`.

This can be useful when installing from scripts. You will need to pass the
path to the home directory in this case.

### Temporary install

Useful if you want to use bouncing-vim for a single pairing session.

* Install with: `./install/temp`.
* Remove with: `./install/remove-temp`.

In both cases:

* the plugins will be cloned from github into `~/.vim/bundle/`
* existing plugins will be skipped (based on the name of the github repo)

### Updating existing Vim plugins

You can use the following oneliner.

    cd ~/.vim/bundle && { \
      find * -maxdepth 0 -type d | \
        while read repo; do \
          echo "---- $repo ----"; \
          cd $repo; \
            git pull origin master; \
            cd ..; \
          echo; \
        done; \
      cd -; \
    }

### Integration with the terminal

#### Use vim as default editor

It's useful to set Vim as default editor. If you wish to do so, put this
in your `~/.bashrc` or `~/.bash_profile`:

    export EDITOR='vim'

#### 256 colours in tmux

To support 256-color colorschemes in tmux, put this in your `~/.bashrc`
or `~/.bash_profile`:

    if [[ -n "$TMUX" ]]; then
      export TERM=screen-256color
    else
      export TERM=xterm-256color
    fi

#### Pass Ctrl-S and Ctrl-Q through

Put this in your bash profile to bypass the key combination only from Vim:

    vim() {
      local STTYOPTS="$(stty --save)"
      # Prevent CTRL-S from suspending the output stream
      stty stop '' -ixoff
      # Prevent CTRL-Q from waking up the output stream
      stty start '' -ixon
      command vim "$@"
      stty "$STTYOPTS"
    }

To always bypass these keys one can simply add this instead:

    # Prevent CTRL-S from suspending the output stream
    stty stop '' -ixoff
    # Prevent CTRL-Q from waking up the output stream
    stty start '' -ixon

List of included plugins
------------------------

### Essentials

Functionality

* [Ack-vim](https://github.com/mileszs/ack.vim) - Run [ack](http://beyondgrep.com/) from Vim, and shows the results in a split window.
* [commentary.vim](https://github.com/tpope/vim-commentary) - Comment stuff out.
* [Ctrl-P](https://github.com/kien/ctrlp.vim) - Full path fuzzy file, buffer, mru, tag, ... finder for Vim, written in pure Vimscript.
* [fugitive.vim](https://github.com/tpope/vim-fugitive) - A Git wrapper so awesome, it should be illegal.
* [MiniBufExplorer](https://github.com/fholgado/minibufexpl.vim) - Elegant buffer explorer, takes very little screen space.
* [Multiple cursors](https://github.com/terryma/vim-multiple-cursors) - Sublime Text style multiple selections for Vim.
* [NERDTree](https://github.com/scrooloose/nerdtree) - Explore the filesystem in a hierarchical tree structure and open files and directories.
* [Sensible](https://github.com/tpope/vim-sensible) - A universal set of defaults that (hopefully) everyone can agree on.
* [Supertab](https://github.com/ervandew/supertab) - Perform all your Vim insert mode completions with Tab.
* [Tabular](https://github.com/godlygeek/tabular) - Vim script for text filtering and alignment.
* [Surround](https://github.com/tpope/vim-surround) - Edit parentheses, brackets, quotes, XML tags, and more in pairs.
* [repeat.vim](https://github.com/tpope/vim-repeat) - enable repeating supported plugin maps with "."
* [Ultisnips](https://github.com/SirVer/ultisnips) - An implementation of TextMates Snippets for the Vim Text Editor. Requires Vim compiled with Python support.
* [vim-snippets](https://github.com/honza/vim-snippets) - vim-snipmate default snippets

Language support

* [Tim Pope's Markdown](https://github.com/tpope/vim-markdown), particularly for its ability to highlight code blocks in the respective language.

Colorschemes

* [Agnostic](https://github.com/ygt-mikekchar/agnostic) - A Vim colour scheme that allows to choose your own colours.
* [Solarized](https://github.com/altercation/vim-colors-solarized) - Precision colors for machines and people.

### Nice-to-have's

These are only installed when running the full install: `./install/essential`

* [Coffeescript](https://github.com/kchmck/vim-coffee-script) - Adds CoffeeScript support to Vim. It covers syntax, indenting, compiling, and more.
* [JSX](https://github.com/mxw/vim-jsx)
* [CJSX](https://github.com/mtscout6/vim-cjsx.git)
* [rails.vim](https://github.com/tpope/vim-rails) - Ruby on Rails power tools.
* [Ruby](https://github.com/vim-ruby/vim-ruby) - Vim configuration files for editing and compiling Ruby within Vim.
* [RSpec.vim](https://github.com/mikbe/rspec.vim) - RSpec syntax highlighting for non-Rails projects.
* [Python Syntax](https://github.com/hdima/python-syntax) - Python syntax highlighting script for Vim.
* [vim-ruby-xmpfilter](https://github.com/t9md/vim-ruby-xmpfilter) - Helper for ruby's xmpfilter or seeing_is_believing. Evaluates Ruby code inline and print the result as a comment at the end of the line.
* [vim-go](https://github.com/fatih/vim-go) - Full featured Go development environment. This plugin will create the executable it needs, if the golang runtime is available, the first time Vim is run. This might take a couple of minutes.
* [Puppet](https://github.com/rodjek/vim-puppet)
* [Dockerfile](https://github.com/ekalinin/Dockerfile.vim)
* [Vimux](https://github.com/benmills/vimux) - Easily interact with tmux from Vim.
* [Mustache](https://github.com/mustache/vim-mustache-handlebars) - A Vim plugin for working with mustache and handlebars templates.

Colorschemes:

* [Noctu](https://github.com/noahfrederick/vim-noctu) - A Vim color scheme for 16-color terminals.
* [Base16](https://github.com/chriskempson/base16-vim) - Color schemes for hackers.
* [Molokai](https://github.com/tomasr/molokai) - A Vim port of the monokai theme for TextMate.

Features
--------

### Third party plugins setup

* **CtrlP**
  - include hidden files in the results
  - ignore some common dirs and file types
  - open the buffer list with `<leader>+b`
  - do not reuse existing buffers (according to the feedback, this is usually
    not what the user would expect)

* **Ack**
  - launch `:Ack!` with `<leader>a`
  - use [Ag The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
    if available, to go even faster
  - use a customised command to ignore some patterns to account for
    missing `~/.ackrc` and `~/.agignore`

* **NERDTree**
  - toggle with `<leader>n`
  - jump to the current buffer with `<leader>f` (as in "find...")
  - ignored compiled files
  - show hidden files by default
  - use minimal UI
  - disable prompt to delete buffer when a file is removed
  - prevent NERDTree from opening a buffer in a new split by mistake

* **vimux**
  - `<leader>rb`: run the current file with rspec
  - `<leader>rp`: prompt for a command to run
  - `<leader>rr`: run last command executed by VimuxRunCommand
  - `<leader>ri`: inspect runner pane
  - `<leader>rx`: close all other tmux panes in current window
  - `<leader>rq`: close Vim tmux runner opened by VimuxRunCommand
  - `<leader>rs`: interrupt any command running in the runner pane

* **Vim Ruby**
  - enable syntax highlight for Ruby operators

* **Ruby xmpfilter**
  - in terminal Vim press `F4` to mark the line, `F5` to evaluate
  - in Gvim press `Meta-m` to mark the line, `Meta-r` to evaluate

* **MiniBufExplorer**
  - position at the top
  - do not open by default
  - focus the buffer list with `<leader>t`
  - toggle the buffer list with `<leader>m`

### Language specific settings

* **Java**
  - soft tab with 4 spaces

* **Python**
  - soft tab with 4 spaces
  - use `indent` as `foldmethod`

* **golang**
  - hard tabs with 4 spaces
  - uses the fatih/vim-go plugin
  - uses Ultisnips as snippet engine

* **markdown**
  - highlight code blocks in the respective language

* **Ruby**
  - see setup of the Vim Ruby plugin
  - see setup of the xmpfilter plugin

### Miscellaneous options

* Reduce the timeout required to recognize a command from 1000 ms (the default)
  to 350 ms.

* Joining lines:
  - remove the comment symbols when joining lines with `J`
  - only use one space after punctation ([wiki](http://en.wikipedia.org/wiki/Sentence_spacing#Typography))

* Enable breakindent if supported by the vim version.

* Use 2-space soft tabs by defaults (it's overridden for some some languages
  with different conventions).

* Omni-completion is enabled (use the native `<C-x><C-o>` to invoke it).

### Miscellaneous mappings

* Leader is mapped to the popular `,` but `\` is still supported.

* Map `<F1>` to `<Esc>` to avoid bringing up the help by mistake.

* Map `jj`, `jk` and `kj` to `<Esc>`: popular shortcuts that allow to stay on
  the home row.<br>
  Notice that `jk` is included even though it will prevent you from quickly
  typing 'Dijkstra'.

* Toggle `paste` with `<F3>`, that disables all automatic indentation when
  pasting from the system clipboard.

* Toggle spell checking with `<F6>` as in Sublime Text.

* Edit new file in new path with `:EP` ("edit with path"). You can also use
  `<C-y>` once you are in CtrlP.

* Disable activating ex-mode when typing `Q` in normal mode. This is almost
  always a typo, and it's been set to no-op, reserving it for future use.

### Navigation

* Arrows are enabled to accommodate users that have different styles of
  usage.

* Moving between lines works by visible lines instead of actual lines (useful
  when wrap is enabled).

* Home key
  - pressing the home key will bring to the first non-blank character (like `^`)
  - pressing again will bring to the first column (like `0`)
  - after that it will toggle between the two positions<br>
  <br>
  A keycode fix is provided for this to work inside Tmux.

* Quickfix list
  - go to the next with `]q`, to the previous with `[q`

### Mouse support

Mouse features are fully enabled.

### Anti-typo command aliases

Some commands like `:w`, `:q` and similar have been aliased with the upper
case version to account for common misspellings.

### Last position in file

When reopening a file, the cursor will jump to the position where it was the
last time the buffer was opened.

### Bubbling lines

Quickly move lines up and down with `CTRL+ArrowUp/Down` and `CTRL+k/j`.

It operates on single lines in normal mode, on multiple lines in visual mode.

Keycode fixes are provided for this to work in Tmux as well.

Note: this doesn't interfere with the copy and cut operations because it uses
the `move` command.

### Buffer enhancements

* Reuse a buffer if a file is already open.

* Switch between buffers with the same shortcuts used for tabs, for example
  in Chrome: `CTRL+PageUp/PageDown`;<br>
  on those machines where that doesn't work (Mac), `<leader>+[` and `<leader>+]` can
  be used.

* Quick close the current buffer without closing its window with `CTRL+q`, or
  `ALT+q`, or `<leader>+q`.

* Close all buffers
  - all the non-special ones with `<Leader>ca` in normal mode
  - only the hidden ones with `<Leader>ch` in normal mode

* Copy the path of the current buffer to the system clipboard
  - relative path with the sequence `cp` in normal mode
  - full path with the sequence `cpp` in normal mode

* MiniBufExplorer customisation
  - position at the top
  - do not open by default
  - focus the buffer list with `<leader>t` (open if necessary)
  - toggle the buffer list with `<leader>m`
  - if using the vimrc: simplified colours (only active and non-active are
    differentiated)

* Buffergator plugin customisation
  - open at the bottom to be consistent with default Ctrl-P behaviour
  - set size to 10 rows
  - (experimental: replaced with CtrlPBuffer) toggle with `<leader>+b`

* CtrlP buffer list: open with `<leader>b`. It might replace buffergator
  in the future.

### Clipboard

* Yank to the end of the line with `Y`, to make it consistent with `C` and `D`.
  This was removed from sensible.vim.

* Reselect the last pasted text with `<leader>v`. Remember that reselecting
  the last visual selection can be done with the native `gv` instead.

* Copy the visual selection to the system clipboard with `CTRL+c`.<br>
  For Mac users requires additional configuration:
  <https://coderwall.com/p/j9wnfw><br>
  Note: this works locally, or it requires forwarding X11 in ssh connections.

* Configuration is provided to support system clipboard in Tmux as well,
  see `./plugin/clipboard.vim`

* In visual mode, use `<leader>p` to paste from the default register without
  replacing the content of the register.
  This allows to paste multiple times the same text.

### Real delete

Vim conflates the two functionalities of deleting and cutting.

The `ALT+d` (or `<leader>d`) shortcut provided to do real deletion
(cut to the blackhole register in Vim parlance):

* current line in normal mode
* selection in visual mode

### Current directory

* Expand `%%` to the current directory in the command prompt.

* Set the working directory to the directory of the current file with
`<leader>cd`.

### Read and write options

* As version control is effectively ubiquitous, the following are disabled
  - backup files
  - swap files
  - persistent undo

* Autowrite when switching to a different buffer or split pane, to avoid
  running tests with unsaved changes by only saving the last edited buffer.

* Quick save with `CTRL-s`. This is a very useful feature, albeit a
  controversial one. <br>
  See [Ben Orenstein's talk](http://www.youtube.com/watch?v=SkdrYWhh-8s)
  on why that's a good idea.

  As some terminals use `CTRL-s` to suspend the output stream, this requires
  additional setup, see "Integration with the terminal" for how to do this.

* Write with sudo with `:Sudow`.

### Search features

* Highlight current word or selection with `<leader>h` (that is, search
  without jumping to the next found occurrence).

* Search visual selection with `*`.

* Smart ignore-case (consider case only if the search term contains a mix of
  of upper and lower case).

* Replace all the occurrences in a line by default, (no need to specify `g`)

* Highlighting
  - highlight results
  - clear highlighted results with `CTRL-l` (same as in "clearing" the terminal).
  - highlight matching parentheses without jumping to the closing one.

* Ignore some directories and extensions (tmp, pyc, ...).

**Search in files and external grep programs**

People have different habits and opinions when it comes to search within
multiple files.

ack.vim is very popular but not with everyone, due the need to install or
compile additional packages.

Sometimes the plugins ack.vim or fugitive (which provides `:Ggrep`) are not
available.

In these cases some minimal search helpers can be useful.

* Use external grep programs (for the native `:grep` command):
  - if available use `ag` or `ack`
  - otherwise use a more generally useful custom `grep` command

* Provide commands which will execute the search and open the results in
  the quickfix list:
  - `:G` command (shortcut `\\`) will run `:grep`;
  - `:GG` command (shortcut `\\\`) will run `:!git grep`; if one or more
    arguments are provided it will use them, otherwise it will search for
    the current word;

* Provide a precompiled `noautocmd vimgrep` (shortcur `<Leader>-s`) command
  that searches for the current word in files with the same extension as
  the current one.

Plans for these features:

- add the capability to search implicitly for the current word to `:G`
- add the capability to seach for the visually selected text to both `:G` and `:GG`
- make the `vimgrep` helper more fault-tolerant

### Run shell command without prompting

This is especially useful when one wants to run a command in a diffent tmux
window or pane.

Example: to run the tests in the second pane of the first tmux window,
enter the following in the Vim prompt:

    :Silent tmux send-keys -t 1.2 "bundle exec rspec spec/my_spec.rb" C-m

### Tmux integration

See the installation notes to use the provided `.tmux.conf` or copy the
recommended sections to your own.

* Fix keycodes
  - tmux will send xterm-style keys when its xterm-keys option is on
  - this requires `set -g xterm-keys on` in the `~/.tmux.conf`
  - fix `CTRL-Page<Up/Down>` (this is required for tab-like navigation
    between buffers)
  - fix `<Home>` key
  - fix modifiers (like `CTRL-Right/Left`, `ALT-Up/Down/Left/Right`...)

* Seamless navigation between tmux and Vim with `ALT-Up/Down/Left/Right` and
  `ALT-k/j/h/l`.
  `<M-Down>` and `<M-Up>` will not work on ChromeOS because that is mapped
  natively to `<PgUp>` and `<PgDown>`.

### View options

* Disable all bells.

* Use UTF-8 encoding.

* Display line numbers.

* Toggle line numbers with `CTRL-n`.

* Leave 3 visible lines and columns when scrolling.

* Create new splits bottom and right.

* Disable wrapping text.

* Autoindent.

* Highlight currently edited line.

* Allow backspace on everything.

* Disable welcome screen.

* Allow placing the cursor after the last character in block-visual mode.

* Display vertical rulers at column 81 and 101 as a reference for keeping lines
  of code at an acceptable length.

### Statusbar

* Show the commands that are being executed.

* Show the current status (normal, visual...).

* Show cursor position in lower right.

* For specific colorschemes: Highlight the statuslines when in insert mode.
  (currently solarized only).

### Whitespace

* Toggle trailing whitespace highlighting with `<leader>w` (off by default).

* Remove trailing whitespace on save, to avoid false conflicts in version
  control:
  - only for specified filetypes (see `./plugin/whitespace.vim`)
  - ensure no whitespace at the end of lines
  - ensure exactly one newline character at the end of file

### `vimrc` options

* Source automatically `.vimrc` and `.vimrc.after` on save.

* Enable per-directory vimrc.

* Disable unsafe commands in local vimrc files.

* Additional configuration can be put in `~/.vimrc.after` that will be loaded
  automatically if present.
