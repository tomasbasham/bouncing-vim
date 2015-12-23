#!/usr/bin/env bash

NO_PROMPT_FINAL_MESSAGE="
  Your vimrc, if one was present, has been backed up and replaced with a link to
  the vimrc provided with this plugin, to guarantee the proper functioning of
  the setup.

  Please move your own additional setup to ~/.vimrc.after.
"

declare -a -r ESSENTIALS=(
  "altercation/vim-colors-solarized"
  "elzr/vim-json"
  "ervandew/supertab"
  "fholgado/minibufexpl.vim"
  "godlygeek/tabular"
  "honza/vim-snippets"
  "ctrlpvim/ctrlp.vim"
  "lucabelmondo/bouncing-vim"
  "mileszs/ack.vim"
  "scrooloose/nerdtree"
  "scrooloose/syntastic"
  "Shutnik/jshint2.vim"
  "SirVer/ultisnips"
  "terryma/vim-multiple-cursors"
  "tpope/vim-commentary"
  "tpope/vim-fugitive"
  "tpope/vim-markdown"
  "tpope/vim-pathogen"
  "tpope/vim-repeat"
  "tpope/vim-sensible"
  "tpope/vim-surround"
  "ygt-mikekchar/agnostic"
)

declare -a -r NICE_TO_HAVES=(
  "benmills/vimux"
  "chriskempson/base16-vim"
  "ekalinin/Dockerfile.vim"
  "fatih/vim-go"
  "hdima/python-syntax"
  "kchmck/vim-coffee-script"
  "mikbe/rspec.vim"
  "mtscout6/vim-cjsx"
  "mustache/vim-mustache-handlebars"
  "mxw/vim-jsx"
  "noahfrederick/vim-noctu"
  "rodjek/vim-puppet"
  "t9md/vim-ruby-xmpfilter"
  "tomasr/molokai"
  "tpope/vim-rails"
  "vim-ruby/vim-ruby"
)
