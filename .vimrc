""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bootstrapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather than Vi settings.
set nocompatible

" Set file encoding
set encoding=utf-8

" Convert file to the given encoding
set fileencoding=utf-8

" Disable filetype checks during bootstrapping
filetype off

" Set runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Initialize plugins
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" CtrlP https://github.com/ctrlpvim/ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'

" NERDTree https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

" Airline https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'

" Airline Themes https://github.com/vim-airline/vim-airline-themes
Plugin 'vim-airline/vim-airline-themes'

" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" vim-gitgutter https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" Emmet https://github.com/mattn/emmet-vim
Plugin 'mattn/emmet-vim'

" https://github.com/chriskempson/base16-vim
Plugin 'chriskempson/base16-vim'

" Syntastic https://github.com/scrooloose/syntastic
Plugin 'scrooloose/syntastic'

" https://github.com/pangloss/vim-javascript
Plugin 'pangloss/vim-javascript'

" https://github.com/tpope/vim-commentary
Plugin 'tpope/vim-commentary'

call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable file type detection and do language dependent indenting.
filetype plugin indent on

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Increase the maximum history length
set history=500

" Center cursor when scrolling
set scrolloff=999

" Enable syntax highlighting
syntax enable

" Set tab width
set tabstop=2

" Indent width 2 spaces
set shiftwidth=2

" Set tab width when editing
set softtabstop=2

" Convert tabs to spaces
set expandtab

" Enable auto indentation
set autoindent


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set background
set background=dark

" Enable 256 color support
let base16colorspace=256

" Set colorscheme
colorscheme base16-tomorrow

" Show line numbers
set number

" Add spacing to line numbers
set numberwidth=2

" Set status line
set laststatus=2

" Always show the current cursor position
set ruler

" Display visual menu at bottom during filecompletion
set wildmenu

" Highlight current line
set cursorline

" Display whitespace
set list listchars=trail:·,nbsp:·

" Always split windows to the right
set splitright


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable backup support
set backup

" Sets the backup directory
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Skip backup if pattern matches
set backupskip=~/tmp/*,/private/tmp/*

" Create a backup before overwriting a file
set writebackup

" Disable swap files
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trim trailing trailing whitespace
function! TrimTrailingWhitespace()
  %s/\s\+$//e
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set <Leader>
let mapleader=' '

" CtrlP Bindings
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmp='CtrlP'

" Easier movement between splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Map NERDTree
nmap <C-b> :NERDTreeToggle<cr>

" Trim trailing whitespace
nnoremap <silent> <Leader>rtw :call TrimTrailingWhitespace()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trim trailing whitespace on Buffer and File write ops
augroup remove_trailing_spaces " {
  autocmd!
  autocmd FileWritePost * :call TrimTrailingWhitespace()
  autocmd BufWritePost * :call TrimTrailingWhitespace()
augroup END " }


" Reload .vimrc after any changes were made
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

