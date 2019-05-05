" General {{{
let mapleader=","                        " Set mapleader to comma
nnoremap <leader>w :w!<cr>               " Fast saving
nnoremap <leader>ev :vsp $MYVIMRC<CR>    " Open init.vim
nnoremap <leader>sv :source $MYVIMRC<CR> " Source init.vim
" }}}
" Vim-Plug {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'

Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/IndexedSearch'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'

call plug#end()
" }}}
" Plugin Configuration {{{
" Vim Better WhiteSpace
let g:better_whitespace_enabled=1 " To disable highlighting whitespace
let g:strip_whitespace_on_save=1  " To enable stripping whitespace on saving
let g:strip_whitelines_at_eof=0   " To strip white lines at the end of the file when stripping whitespace

" Vim Airline
let g:airline_theme='base16'    " Set theme to base16
let g:airline_powerline_fonts=1 " Populate automatically the g:airline_symbols dictionary with the powerline symbols
let g:airline#extensions#tabline#enable=1 " Automatically displays all buffers when there's only one tab open

" }}}
" Colors {{{
set termguicolors
colorscheme NeoSolarized
set background=dark " Need this option to get Solarized Dark
" }}}
" Spaces & Tabs {{{

" When NeoVim opens a file and reads a TAB character,
" it uses this value to visually show the TAB
set tabstop=4

" This value is the number of spaces that is inserted when you hit TAB
" and also the number of spaces that are removed when you backspace
set softtabstop=4

set expandtab " Converts tabs to white space
"}}}
" UI Config {{{
set cursorline " Highlight current line
set lazyredraw " Redraw only when we need to
set number     " Show line numbers
set showmatch  " Show matching brackets.
" }}}

" Do case insensitive matching
set ignorecase

" Middle-click paste with mouse
set mouse=v

" Width for autoindents
set shiftwidth=4

" get bash-like tab completions
set wildmode=longest,list

" set an 120 column border for good coding style
set cc=120

" Toggle spelling
nnoremap <leader>s :set invspell<CR>

" vim:foldmethod=marker:foldlevel=0