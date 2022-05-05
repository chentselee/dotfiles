" base
set nocompatible
set autoread " reload files when changed on the disk
set noswapfile
set nobackup
set novisualbell
set noerrorbells
set updatetime=50 " for GitGutter
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" undo dir
" set undodir=~/.vim/undodir
" set undofile

" indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" hide status and command
set noshowmode
set noshowcmd

" tab
set expandtab
set smarttab
set shiftround

" resursive file searching
set path+=**
set wildmenu
set wildignore+=*/node_modules/**,*/.git/**,*/dist/**,*/build/**,*/output/**

" search
set incsearch
set nohlsearch
set ignorecase      " ignore case
set smartcase     " but don't ignore it, when search string contains uppercase letters

"relative line number on command / absolute on insert
set number relativenumber
augroup numberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup end

" split window
set splitright
set splitbelow

" clipboard
set clipboard=unnamedplus

" mouse
set mouse=a

" keep buffers loaded
set hidden

" visual
set scrolloff=10
set wrap
set showmode
set guicursor=
syntax on
filetype on
set background=dark
set t_Co=256

" set leader key to space
let g:mapleader=" "

" map
nnoremap <Leader>b :b#<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>w <C-W>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap H ^
nnoremap L $
tnoremap <Leader><Esc> <C-\><C-N>
tnoremap <Leader>` <C-\><C-N>:b#<CR>
" select all
nnoremap <Leader>a ggVG 
" search and replace under cursor
nnoremap <C-S> :%s/<C-R><C-W>/<C-R><C-W>/g<Left><Left><Left>
" navigate quickfix list
nnoremap <Leader>cqn :cnext<CR>
nnoremap <Leader>cqp :cprev<CR>
" navigate location list
nnoremap <Leader>cln :lnext<CR>
nnoremap <Leader>clp :lprev<CR>
" toggle quickfix and location list
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
nnoremap <silent> <Leader>cqt :call ToggleQuickFix()<CR>
function! ToggleLocationList()
  if empty(filter(getwininfo(), 'v:val.loclist'))
    lopen
  else
    lclose
  endif
endfunction
nnoremap <silent> <Leader>clt :call ToggleLocationList()<CR>
" netrw
nnoremap <Leader>e :Lex<CR>
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_keepdir = 0
function! NetrwMapping()
  nmap <buffer> L <CR>:Lex<CR>
endfunction
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
