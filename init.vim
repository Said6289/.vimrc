"Vundle vim {{{
set nocompatible              "be iMproved, required
filetype off                  "required

""Initialize Vundle
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/plugins')

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ianks/vim-tsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'dart-lang/dart-vim-plugin'

call vundle#end()

""Add all plugins before this line

"filetype plugin indent on
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
"}}}

"General Settings {{{
set fileencoding=utf-8
set encoding=utf-8
set relativenumber
set ruler               "Show the cursor position
set listchars=trail:-   "Display trailing whitespace as dashes
set list
set numberwidth=4
set number
set showcmd             "Display incomplete commands
set autowrite           "Automatically :write before running commands
set expandtab
set scrolloff=3         "Trying this one, for better scrolling
set showmode
set showcmd             "Show partial command
set visualbell
set cursorline          "Show the line where the cursor is
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set undofile            "Persistent undoing even after filed is closed
""Open split panes to the right, and below
set splitbelow
set splitright
"" Use vertical diffs
set diffopt+=vertical
"}}}

"Search Stuff {{{
"use normal regex
nnoremap / /\v
vnoremap / /\v
"intelligent case sensitive search
set ignorecase
set smartcase

"highlight search matches on the fly
set incsearch
set noshowmatch
set hlsearch
"}}}

"Long Lines {{{
set nowrap
set textwidth=80
set formatoptions-=t
"}}}

syntax on
filetype on
set tabstop=4
set shiftwidth=4

let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": [],
      \ "passive_filetypes": [] }

let g:gruvbox_italics=1
let g:gruvbox_bold=1
colorscheme gruvbox
set background=dark
highlight Normal ctermbg=black

"General Mappings {{{

"quicker <esc>
inoremap jk <C-\><C-n>
tnoremap jk <C-\><C-n>

map <F5> :make<CR>

"}}}

""Vismcript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

autocmd BufNewFile,BufRead *.cls set filetype=java
autocmd BufNewFile,BufRead *.trigger set filetype=java
autocmd BufNewFile,BufRead *.cmp set filetype=xml
autocmd BufNewFile,BufRead *.vue set filetype html
