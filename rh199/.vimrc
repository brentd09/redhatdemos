set nocompatible                                                 " Ensure vim settings are applied
set expandtab                                                    " Use spaces instead of tabs
set shiftwidth=2                                                 " Set the number of spaces to use for each step of (auto)indent
set tabstop=2                                                    " Number of spaces that a <Tab> counts for
set autoindent                                                   " Enable automatic indentation
set smartindent
syntax on                                                        " Enable syntax highlighting
autocmd FileType sh setlocal shiftwidth=2 tabstop=2 expandtab    " Set file specific configurations using autocmd
filetype plugin indent on                                        " Enable filetype detection, plugin, and indentation
set fileformats=unix,dos                                         " This setting tells Vim to recognize both Unix (LF) and DOS (CRLF) line endings when opening files.
autocmd BufWritePre * :%s/\r\n/\r/g                              " This command replaces all CRLF pairs with a single carriage return whenever a file is saved.
