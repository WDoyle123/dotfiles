" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" List of plugins goes here
Plug 'preservim/nerdtree'   
Plug 'wakatime/vim-wakatime'

" Other plugins can be added here

" Initialize plugin system
call plug#end()

" Basic settings
syntax enable                      " Enable syntax highlighting
set tabstop=4                      " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4                   " Number of spaces to use for each step of (auto)indent
set expandtab                      " Use spaces instead of tabs
set smartindent                    " Smart autoindenting on new lines

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>      " Ctrl-n to open/close NERDTree
