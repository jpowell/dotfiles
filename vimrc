" ------------ <INITIAL CONFIG> ------------------
  set nocompatible
  filetype off
" ------------ </INITIAL CONFIG> -----------------

" ------------ <PLUGIN INSTALL> ------------------
  " -> VUNDLE SETUP
  set rtp+=~/.vundle/Vundle.vim
  call vundle#begin('~/.vundle')
  Plugin 'gmarik/Vundle.vim'

  " -> APPEARANCE
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " -> SYNTAX
  Plugin 'beyondwords/vim-twig.git'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'ngmy/vim-rubocop'
  Plugin 'w0rp/ale.git'
  Plugin 'zpieslak/vim-autofix.git'
  Plugin 'github/copilot.vim'

  " -> Testing
  Plugin 'junegunn/vader.vim'

  " -> LANGUAGE SUPPORT
    "Typescript
  Plugin 'leafgarland/typescript-vim'
  Plugin 'peitalin/vim-jsx-typescript'
  Plugin 'Quramy/tsuquyomi'
  Plugin 'Shougo/vimproc.vim'

    "Ruby
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-rails'

  " -> NAVIGATION
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'rking/ag.vim'

  " -> GIT SUPPORT
  Plugin 'tpope/vim-fugitive'

  " -> FUNCTIONAL / KEYSTROKES
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-unimpaired'

  call vundle#end()
  filetype plugin indent on
" ------------ </PLUGIN INSTALL> -----------------

" ------------ <BASIC CONFIG> --------------------
  " -> READING FILES
  set encoding=utf-8
  set autoread
  set modelines=0

  " -> TABS / INDENTATION
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set autoindent
  set smartindent

  " -> SEARCH
  set ignorecase
  set smartcase
  set gdefault
  set incsearch
  set showmatch
  set hlsearch

  " -> NAVIGATION / BEHAVIOR
  set scrolloff=2
  set visualbell
  set ttyfast " fast moving
  set backspace=indent,eol,start
  set laststatus=2
  set shell=bash
  set wildignore+=*/node_modules/*

  " -> APPEARANCE
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
  set number relativenumber

  " -> WINDOW AUTO-RESIZING
  " We have to have a winheight bigger than we want to set winminheight. But if
  " we set winheight to be huge before winminheight, the winminheight
  " set will fail.
  set winwidth=85 winheight=15
  set winminheight=10 winheight=999

  " -> PROJECT SPECIFIC VIM CONFIG SETUP
  set exrc
  set secure

  " -> SWAP
  set directory=~/.vim/_data/swap

  " -> SYNTAX
  syntax enable
  set background=dark
  let g:solarized_visibility='low'
  colorscheme solarized
" ------------ </BASIC CONFIG> -------------------

" ------------ <BASIC MAPPINGS> ------------------
  " -> ENABLE MOUSE
  set mouse=a
  noremap / /\v

  " -> MATCHING BRACES
  noremap <tab> %

  " -> SPLITS
  nnoremap <c-h> <c-w>h
  nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-l> <c-w>l
" ------------ </BASIC MAPPINGS> -----------------

" ------------ <LEADER MAPPINGS> -----------------
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
  " load plugins
  nnoremap <leader>ip :PluginInstall<cr>
  nnoremap <leader>up :PluginUpdate<cr>

  " run current ruby file
  nnoremap <leader>rf :!ruby %<cr>
" ------------ </LEADER MAPPINGS> ----------------

" ------------ <PLUGIN CONFIG> -------------------
  " -> AG
  nnoremap <leader>a :Ag --silent -Q<space>

  " -> AIRLINE
  let g:airline_solarized_bg='dark'
  let g:airline_powerline_fonts = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.maxlinenr = ''
  let g:airline_section_y = ''
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#ale#enabled = 1

  " -> ALE
  let g:ale_completion_enabled = 1
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_enter = 0
  let g:ale_set_balloons = 1
  let g:ale_sign_error = '!!'
  let g:ale_sign_warning = '_!'
  let g:ale_typescript_tslint_executable = 'tslint'
  let g:ale_typescript_tslint_use_global = 0
  let g:ale_typescript_tslint_config_path = './tslint.json'
  let g:ale_linters = {
        \ 'ruby': ['rubocop', 'ruby'],
        \ 'javascript': ['eslint'],
        \ 'typescript': ['tsserver', 'eslint', 'tslint']
      \}

  " -> CTRLP
  let g:ctrlp_working_path_mode = 2
  let g:ctrlp_max_files = 0
  let g:ctrlp_max_depth = 8
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  endif
  highlight Pmenu ctermbg=238 gui=bold
  nnoremap <leader>t :CtrlP<cr>

  " -> FUGITIVE
  nnoremap <leader>gs :Gstatus<CR>

  " -> RSPEC-VIM
  let g:rspec_runner = "os_x_iterm"
  let g:rspec_command = ":!docker compose run web ./bin/rspec {spec}"
  map <Leader>rcs :call RunCurrentSpecFile()<CR>
  map <Leader>rns :call RunNearestSpec()<CR>
  map <Leader>rls :call RunLastSpec()<CR>
  map <Leader>ras :call RunAllSpecs()<CR>

  " -> SOLARIZED
  call togglebg#map("<F6>")
" ------------ </PLUGIN CONFIG> ------------------

" ------------ </FUNCTIONS> ----------------------
function! HighlightAnnotations()
  syn keyword vimTodo contained HACK OPTIMIZE REVIEW
  syn keyword rubyTodo contained HACK REVIEW
  syn keyword coffeeTodo contained HACK OPTIMIZE REVIEW
  syn keyword javaScriptCommentTodo contained HACK OPTIMIZE REVIEW
endfunction
function! StripWhiteSpace()
  :%s/\s\+$//e
endfunction
" ------------ </FUNCTIONS> ----------------------

" ------------ <AUTOCOMMANDS> --------------------
  " -> HIGHLIGHT ANNOTATIONS
  autocmd Syntax * call HighlightAnnotations()

  " -> RELATIVE LINE NUMBER TOGGLE
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

  " -> SPEC KEYWORD CONFIG
  autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it before after subject its shared_examples shared_context let expect should
" ------------ </AUTOCOMMANDS> -------------------

" ------------ <LANGUAGE SUPPORT> ----------------
  " -> CSS
  autocmd BufNewFile,BufRead *.less set ft=scss

  " -> JAVASCRIPT
  autocmd BufNewFile,BufRead {*.json,*.es*} set ft=javascript

  " -> TYPESCRIPT
  let g:tsuquyomi_disable_quickfix = 1
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

  set completeopt-=preview

  " -> RUBY
  autocmd BufNewFile,BufRead {Capfile,Gemfile,Rakefile,Guardfile,config.ru,.irbrc} set ft=ruby
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

  " -> YAML
  autocmd BufNewFile,BufRead *.yml* set filetype=yaml
" ------------ </LANGUAGE SUPPORT> ---------------
