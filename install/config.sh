#!/usr/bin/env bash


NO_PROMPT_FINAL_MESSAGE="
Your vimrc, if one was present, has been backed up and replaced with a link to
the vimrc provided with this plugin, to guarantee the proper functioning of
the setup.

Please move your own additional setup to ~/.vimrc.after.
"

declare -a -r ESSENTIALS=(
  "ygt-mikekchar/agnostic"
        "mileszs/ack.vim"
   "lucabelmondo/bouncing-vim"
           "kien/ctrlp.vim"
       "fholgado/minibufexpl.vim"
     "scrooloose/nerdtree"
       "ervandew/supertab"
      "godlygeek/tabular"
         "SirVer/ultisnips"
          "honza/vim-snippets"
    "altercation/vim-colors-solarized"
          "tpope/vim-commentary"
          "tpope/vim-fugitive"
          "tpope/vim-markdown"
        "terryma/vim-multiple-cursors"
          "tpope/vim-repeat"
          "tpope/vim-sensible"
          "tpope/vim-surround"
       "benmills/vimux"
     "scrooloose/syntastic"
        "Shutnik/jshint2.vim"
           "elzr/vim-json"
)

declare -a -r NICE_TO_HAVES=(
   "chriskempson/base16-vim"
       "ekalinin/Dockerfile.vim"
         "tomasr/molokai"
          "hdima/python-syntax"
          "mikbe/rspec.vim"
         "kchmck/vim-coffee-script"
          "fatih/vim-go"
       "mustache/vim-mustache-handlebars"
  "noahfrederick/vim-noctu"
         "rodjek/vim-puppet"
          "tpope/vim-rails"
       "vim-ruby/vim-ruby"
           "t9md/vim-ruby-xmpfilter"
            "mxw/vim-jsx"
       "mtscout6/vim-cjsx"
)
