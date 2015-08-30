set mouse=a
execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue
