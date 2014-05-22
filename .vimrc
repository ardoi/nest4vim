
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 

" let Vundle manage Vundle
"  " required! 
Bundle 'gmarik/vundle'
"My bundles
Bundle 'kien/ctrlp.vim.git'
Bundle 'Lokaltog/powerline'
Bundle 'klen/python-mode.git'
Bundle 'tpope/vim-sensible.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-markdown.git'

filetype plugin indent on
" Disable python folding
let g:pymode = 1
let g:pymode_folding = 0
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
"
set nocompatible
set mouse=a
syntax on
set t_Co=256
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
colorscheme molokai
set laststatus=2
set autoindent

set autoread
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set noswapfile
set novb
set grepprg=grep\ -nH\ $*
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"set guifont=Terminus\ 14
"set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 14

let g:tex_flavor='latex'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
"let g:pymode_rope_autocomplete_map = '<A-Space>'
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_checkers = ['pyflakes']
"pyflakes, pep8, mccabe, pylint, pep257
"
"autocmd! bufwritepost .vimrc source %

set guioptions-=T
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

"ignore latex crap
let NERDTreeIgnore=['\.log$', '\.lot$', '\.aux$','\.pdf$','\.toc$','\.bbl$','\.out$','\.pyc$']
"let g:ctrlp_custom_ignore = 'log'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
  \ 'file': '\v\.(exe|so|dat|pyc)$'
  \ }
    
" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin on
  filetype indent on


  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
autocmd BufNewFile,BufRead *.wiki set ft=googlecodewiki
