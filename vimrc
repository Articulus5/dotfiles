set cursorline
set nowrap
set number
set ruler

syntax on
filetype plugin on
filetype indent on

set tabstop=4
set shiftwidth=4
"set softtabstop=4
"set expandtab
"set smarttab
set autoindent
set smartindent

set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set magic

set autoread
set encoding=utf8

au BufEnter,BufRead *.conf setf dosini
