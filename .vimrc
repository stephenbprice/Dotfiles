let mapleader=","

set nocompatible
set wrap
set encoding=utf8
set autochdir

"VIM-PLUG: install with
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"VIM-PLUG - install plugins with :PlugInstall

call plug#begin('~/.vim/plugged')
"Utilities
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'schickling/vim-bufonly'
Plug 'Shougo/neocomplete.vim'
Plug 'will133/vim-dirdiff'
"UI
Plug 'daylerees/colour-schemes'                         "A bunch of vim colorschemes
Plug 'ajh17/spacegray.vim'                              "Spacegray colorscheme
Plug 'sjl/badwolf'                                      "Badwolf colorscheme
Plug 'itchyny/lightline.vim'                            "Status Line for screen bottom
set laststatus=2                                        "Make room for lightline
"Syntax
Plug 'leafgarland/typescript-vim'                       "Typescript syntax highlighting
"GIT
Plug 'tpope/vim-fugitive'                               "VIM GIT util. Also useful for locating ctags in .git folder
call plug#end()
filetype plugin indent on

"Colors
syntax on
set background=dark
colorscheme badwolf

"UI
set cursorline          "Highlight current line
set number              "Numbered rows
set wildmenu            "Visual autocomplete for command menu
set lazyredraw          "Redraw screen only when necessary
set showmatch           "Show mathcing brace/bracket/paren
"Search
set incsearch
set hlsearch
set ignorecase
nnoremap <leader><space> :nohlsearch<CR>

"Fold
set foldenable
set foldlevelstart=10   "Open folds less then 10 nests deep
set foldnestmax=10      "Max 10 nested folds
noremap <space> za      "za opens/closes folds
set foldmethod=indent   "Fold based on indent level

"Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab

"Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"Misc
inoremap jk <esc>
set clipboard=unnamed
set autoindent          "Autoindent
set tw=0                "Stop auto line breaks
set backspace=indent,eol,start
"Settings
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"      "Vim-Supertab Configuration

"Mapings
nnoremap <C-J> <C-W><C-J> "Split nav
nnoremap <C-K> <C-W><C-K> "
nnoremap <C-L> <C-W><C-L> "
nnoremap <C-H> <C-W><C-H> "

map <C-n> :NERDTreeToggle<CR>

"Auto-reload vimrc on vimrc update
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

au BufRead,BufNewFile *.ts setfiletype typescript
