echo '" Set the number of spaces for indentation' > ~/.vimrc
echo 'set tabstop=2       " Number of spaces that a <Tab> counts for' >> ~/.vimrc
echo 'set softtabstop=2   " Number of spaces a <Tab> counts when editing' >> ~/.vimrc
echo 'set shiftwidth=2    " Number of spaces to use for each step of (auto)indent' >> ~/.vimrc
echo 'set nu              " Show line numbers' >> ~/.vimrc
echo '' >> ~/.vimrc
echo '" Use spaces instead of tabs' >> ~/.vimrc
echo 'set expandtab        " Convert tabs to spaces' >> ~/.vimrc
echo '' >> ~/.vimrc
echo '" Enable syntax highlighting' >> ~/.vimrc
echo 'syntax on            " Enable syntax highlighting' >> ~/.vimrc
echo 'filetype plugin on   " Enable file type detection for proper settings' >> ~/.vimrc
echo '' >> ~/.vimrc
echo '" Enable auto-indentation' >> ~/.vimrc
echo 'set autoindent       " Copy indent from current line when starting a new line' >> ~/.vimrc
echo 'set smartindent      " Enable smart indentation for programming constructs' >> ~/.vimrc
echo '' >> ~/.vimrc
echo '" Automatically indent shell scripts' >> ~/.vimrc
echo 'augroup shellScripts' >> ~/.vimrc
echo '    autocmd!' >> ~/.vimrc
echo '    autocmd FileType sh setlocal shiftwidth=2 softtabstop=2 expandtab' >> ~/.vimrc
echo 'augroup END' >> ~/.vimrc
