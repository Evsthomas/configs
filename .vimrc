
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on	" enable loading indent file for filetype
syntax on

set t_Co=256
colorscheme everett_default

" Add Line Numbers
set number

" CHANGE INDENTATION BEHAVIOR - PYTHON
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

" Turn off autocompletion by use of the period in insert mode.
let g:pymode_rope_complete_on_dot = 0
