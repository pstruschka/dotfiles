if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

filetype plugin indent on
syntax on

set virtualedit=onemore
set backspace=indent,eol,start
set fileformats="unix,dos,mac"

set formatoptions-=t
set formatoptions+=n
set formatoptions+=1

set tabstop=2
set softtabstop=2
set expandtab
set nojoinspaces
set autoindent

set nowrap
set linebreak
set whichwrap=b,s,h,l,<,>,[,]
set showbreak=↪
set textwidth=80

set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:·

"set cursorline
set hidden
set number

set incsearch
set ruler
set wildmenu

runtime macros/matchit.vim

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'

Plug 'Lokaltog/vim-easymotion'

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
call plug#end()

