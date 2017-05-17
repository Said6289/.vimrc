""Vundle Vim ------{{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/plugins')

""""INSTALLED PLUGINS
" " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
"
Plugin 'yggdroot/indentline'
Plugin 'wikitopian/hardmode'
Plugin 'mileszs/ack'
Plugin 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'



call vundle#end()
"ADD ALL PLUGINS BEFORE THIS LINE
filetype plugin indent on
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
"
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
" }}}
"" General settings
set relativenumber
set ruler               "show the cursor position
set conceallevel=0
set numberwidth=4
set number
set showcmd             " display incomplete commands
set autowrite           " Automatically :write before running commands
set expandtab
set scrolloff=3         "Trying this one, for better scrolling
set autoindent
set showmode
set showcmd             "Show partial command
set visualbell
set cursorline          "show the line where the cursor is
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set undofile            "Persistent undoing even after filed is closed
"" Open split panes to the right, and below
set splitbelow
set splitright
"" Use vertical diffs
set diffopt+=vertical
""Show line on 80 characters mark
"""" search sftuff -------{{{
"use normal regex
nnoremap / /\v
vnoremap / /\v
"intelligent case sensitive search 
set ignorecase
set smartcase
set gdefault              "global searches by default

""""" highlight search matches on the fly
set incsearch
set noshowmatch
set hlsearch
"turn off highlights
nnoremap <leader>h   :noh<cr>  
"}}}

"Long Lines ----{{{
set wrap
set textwidth=80
set colorcolumn=+1


"}}}

syntax on
filetype on
"Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
""status line

""style
let g:gruvbox_italics=1
let g:gruvbox_bold=1
colorscheme gruvbox 
set background=dark



""" General mappings --- {{{
"" Set mapleader and local mapleaders
let mapleader=" "



"quicker <esc>
inoremap jk <esc>
inoremap <esc> <c-o>:echoe "Use jk!"<cr>a

"easier colon
"nnoremap ; :

"natural screen line movement
nnoremap j gj
nnoremap k gk

"learn movements
nnoremap ci{ :echoerr "Use ciB!"<cr>
nnoremap ci( :echoerr "Use cib!"<cr>

""Quickly move across windows
nnoremap <leader>w <c-w>v<c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
"don't forget
nnoremap <c-w><c-w> :echoe "Use ctrl-j ctrl-k> ctrl-h ctrl-l!"<cr>

""Insert a white line below, and above
  nnoremap <leader>j o<esc>k
nnoremap <leader>k O<esc>j


"" Open and source the VIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Abbreviations for programming
iabbrev itn int

"" Capitalize word while in insert mode
inoremap <c-u> <esc>vbUwa
"" Capitalize word while in normal mode
nnoremap <c-u> viwU

"" German abbreviations
inoremap ae<c-d> ä
inoremap ue<c-d> ü
inoremap oe<c-d> ö
inoremap ss<c-d> ß
iabbrev fuer für
iabbrev muessen müssen
" }}}

"Auto commands -----{{{
augroup global
  "go back to previous line
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \|exe "normal! g'\"" | endif
  "save when Focus is lost
  au FocusLost * :wa
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c      nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c      :iabbrev <buffer> iff if ()<left><left>
    autocmd FileType c      :iabbrev <buffer> ret return ;<left><left>
augroup END

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript :iabbrev <buffer> ret return ;<left><left>
    autocmd FileType javascript :iabbrev <buffer> func function ()<left><left><left>
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left><left>
augroup END

augroup filetype_latex
    autocmd!
    autocmd FileType tex setlocal conceallevel=0
    autocmd FileType tex nnoremap <buffer> <leader>l :w<cr>:!pdflatex %<cr>:!xdotool search --class mupdf key r<cr>
    autocmd FileType tex :iabbrev <buffer> beging \begin{gather}
    autocmd FileType tex :iabbrev <buffer> endg   \end{gather}
    autocmd FileType tex :iabbrev <buffer> begina \begin{align}
    autocmd FileType tex :iabbrev <buffer> enda   \end{align}
    autocmd FileType tex :iabbrev <buffer> itt    \textit{}<left>
    autocmd FileType tex :iabbrev <buffer> bft    \textbf{}<left>
    autocmd FileType tex :iabbrev <buffer> frac   \frac{}{}<left><left><left>
    autocmd FileType tex :iabbrev <buffer> eot    e^{j \omega t}
    autocmd FileType tex :iabbrev <buffer> ohm   \Omega
    autocmd FileType tex :iabbrev <buffer> kmp    \underline{\hat{}}<left><left>
    autocmd FileType tex :iabbrev <buffer> uline    \underline{}<left>
    autocmd FileType tex inoremap <buffer> $ $$<esc>i
augroup END


augroup filetype_javascript
    autocmd!
    autocmd FileType python     :iabbrev <buffer> ret return
    autocmd FileType python     :iabbrev <buffer> iff if :<left>
    autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
augroup END

augroup filetype_shell
    autocmd!
    autocmd BufNewFile *.sh     I#!/bin/bash<esc>o
    autocmd FileType shell      nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType vim        nnoremap <buffer> <localleader>c I"<esc>
augroup END

" Vismcript file settings ----------------------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

" }}}




