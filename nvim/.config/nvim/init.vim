call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'

Plug 'morhetz/gruvbox'

"Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'kien/rainbow_parentheses.vim'

Plug 'terryma/vim-multiple-cursors'

Plug 'w0rp/ale'

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

call plug#end()

"airline
"let g:airline_powerline_fonts=1
"let g:airline_theme='gruvbox'

set background=dark
"set background=light
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

set list
set cursorline
set number

"esc
imap fd <Esc>

"fzf
map ; :Files<CR>
