" Vim color file
" Maintainer:	Everett Thomas <email address>
" Last Change:	2017 Aug 24

" This is the default color scheme with minor changes.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "everett_default"

" color terminal definitions
hi Comment	ctermfg=32

" vim: sw=2
