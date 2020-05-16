call plug#begin('~/.local/share/nvim/plugged')
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'

Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'kien/rainbow_parentheses.vim'

Plug 'liuchengxu/vim-which-key'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

Plug 'terryma/vim-multiple-cursors'

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'lyuts/vim-rtags'

Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'

call plug#end()

"basics
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set incsearch
set list
set cursorline
set number
set rnu

set colorcolumn=80

set background=dark
"set background=light
let g:gruvbox_contrast_light="soft"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark="soft"
colorscheme gruvbox

"esc
imap jk <Esc>

"nerdtree
let NERDTreeMinimalUI = 1

"ctlp and ack
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_use_caching = 0
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

source $HOME/.config/nvim/modules/coc.vim

"leader
let mapleader = " "
noremap <silent> <Leader> :WhichKey '<Space>'<CR>
set timeoutlen=500


"keys
map <leader>ff :Files<CR>
map <leader>fp :CtrlP<CR>

map <leader>wh :wincmd h<CR>
map <leader>wj :wincmd j<CR>
map <leader>wk :wincmd k<CR>
map <leader>wl :wincmd l<CR>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<Enter>

