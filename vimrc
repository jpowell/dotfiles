" ** BASIC **
filetype on " to prevent non-0 exit codes
filetype off
filetype plugin indent on

call pathogen#infect()
set nocompatible

" ** READING FILES **
set encoding=utf-8
set autoread
set modelines=0

" ** TABS / INDENTATION **
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

" ** SEARCH **
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" ** NAVIGATION / BEHAVIOR **
set scrolloff=2
set visualbell
set ttyfast " fast moving
set backspace=indent,eol,start
set laststatus=2
set shell=/bin/bash

" ** APPEARANCE **
set showmode
set showcmd
set hidden
set cursorline cursorcolumn
set wildmenu
set wildmode=list:longest
set ruler
set wrap linebreak nolist
set formatoptions=qrn1
set list
set listchars=tab:▸\ ,eol:¬
set relativenumber

" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight
" set will fail.
set winwidth=85 winheight=15
set winminheight=10 winheight=999

" ** SYNTAX **
syntax enable
set background=dark
let g:solarized_visibility='low'
colorscheme solarized

" ** MAPPINGS - BASIC **
" enable mouse
set mouse=a
noremap / /\v
" matching braces
noremap <tab> %
" navigate splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" ** MAPPINGS - LEADER **
let mapleader = ","

" unhighlight search
nnoremap <leader><space> :noh<cr>
" previous file
nnoremap <leader><leader> <c-^>
" vimrc editing/sourcing
nnoremap <leader>rv <c-w><c-v><c-l>:e $MYVIMRC<cr>
nnoremap <leader>rl :so $MYVIMRC<cr>
" remove trailing whitespace in current file
nnoremap <leader>ws :call StripWhiteSpace()<cr>
" system clipboard access
noremap <leader>y "*y
noremap <leader>p "*p
" open new splits
nnoremap <leader>w <c-w>v
nnoremap <leader>W <c-w>s
" resize all windows
nnoremap <leader>= <c-w>=

" ** PLUGINS **
" solarized
call togglebg#map("<F6>")
" ctrlp
let g:ctrlp_working_path_mode = 2
highlight Pmenu ctermbg=238 gui=bold
nnoremap <leader>t :CtrlP<cr>
" ag
nnoremap <leader>a :Ag<space>

" ** FUNCTIONS **
function! HighlightAnnotations()
  syn keyword vimTodo contained HACK OPTIMIZE REVIEW
  syn keyword rubyTodo contained HACK REVIEW
  syn keyword coffeeTodo contained HACK OPTIMIZE REVIEW
  syn keyword javaScriptCommentTodo contained HACK OPTIMIZE REVIEW
endfunction
function! StripWhiteSpace()
  :%s/\s\+$//e
endfunction

" ** AUTOCOMMANDS **
autocmd BufNewFile,BufRead *.mobile.erb set ft=eruby.html
autocmd BufNewFile,BufRead *.jst.eco set ft=eruby.html
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.es* set ft=javascript
autocmd BufNewFile,BufRead {Capfile,Gemfile,Rakefile,Guardfile,config.ru,.irbrc} set ft=ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd Syntax * call HighlightAnnotations()

" remove trailing whitespace on save
autocmd BufWritePre *.{au3,css,erb,html,js,json,pl,py,rb} call StripWhiteSpace()

" toggle relative line number
:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it  before after subject its shared_examples shared_context let expect should
