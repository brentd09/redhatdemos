set nocompatible                                                 " Ensure vim settings are applied
set expandtab                                                    " Use spaces instead of tabs
set shiftwidth=2                                                 " Set the number of spaces to use for each step of (auto)indent
set tabstop=2                                                    " Number of spaces that a <Tab> counts for
set autoindent                                                   " Enable automatic indentation
set smartindent
syntax on                                                        " Enable syntax highlighting
autocmd FileType sh setlocal shiftwidth=2 tabstop=2 expandtab    " Set file specific configurations using autocmd
filetype plugin indent on                                        " Enable filetype detection, plugin, and indentation
