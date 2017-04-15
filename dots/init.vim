" Author: Timothy DeHerrera <tim.de9@gmail.com>

" --- GENERAL SETTINGS ---

" Gotta be first (vim only)
set nocompatible

" set color column for 80 chars
set colorcolumn=81

" X11 clipboard access
set clipboard+=unnamedplus

" truecolor
if has('termguicolors')
  set termguicolors
endif

" source custom key binds
source $HOME/.vim/plugins/keybinds.vim

" Make backspace work over \n and insert start
set backspace=indent,eol,start

" line numbers
set number

" show the current command in bottom of screen
set showcmd

" show search matches while typing
set incsearch

" highlight all search matches
set hlsearch

" enable mouse for all modes
set mouse=a

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Convert tabs to spaces
set expandtab

" filetype delcarations
au BufNewFile,BufRead *.ejs set filetype=html

" --- PLUGIN SETTINGS ---

" turn off filetype detection before sourcing plugins
filetype off

" source any plugin file enging in .vim
for file in split(glob('~/.vim/plugins/*.vim'), '\n')
  exe 'source' file
endfor

" Turn on filetype detection and syntax highlighting
filetype plugin indent on
syntax enable
