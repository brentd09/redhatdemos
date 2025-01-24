" Set the number of spaces for indentation
set tabstop=2       " Number of spaces that a <Tab> counts for
set softtabstop=2   " Number of spaces a <Tab> counts when editing
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent
set nu              " Show line numbers  

" Use spaces instead of tabs
set expandtab        " Convert tabs to spaces

" Enable syntax highlighting
syntax on            " Enable syntax highlighting
filetype plugin on   " Enable file type detection for proper settings

" Enable auto-indentation
set autoindent       " Copy indent from current line when starting a new line
set smartindent      " Enable smart indentation for programming constructs

" Automatically indent shell scripts
augroup shellScripts
    autocmd!
    autocmd FileType sh setlocal shiftwidth=2 softtabstop=2 expandtab
augroup END
