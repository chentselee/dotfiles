" base
language en_US
set nocompatible
set autoread " reload files when changed on the disk
set noswapfile
set nobackup
set novisualbell
set noerrorbells
set updatetime=100 " for GitGutter

" undo dir
set undodir=~/.vim/undodir
set undofile

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

" clear search result
nnoremap <silent> <CR> :noh<CR><CR>

" clipboard
set clipboard=unnamedplus

" mouse
set mouse=a

" visual
set scrolloff=10
set wrap
set showmode
syntax on
filetype on
set background=dark
set t_Co=256
colorscheme OceanicNext

" map
let mapleader=' '
nnoremap <Leader>b :b#<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>w <C-W>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap H ^
nnoremap L $
" select all
map <Leader>a ggVG 

" Plug
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'bkad/CamelCaseMotion'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ianks/vim-tsx'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'prettier/vim-prettier', {'do': 'yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

" NERDTree
let NERDTreeWinSize=25
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1
map <silent> <Leader>n :NERDTreeToggle<CR>
" open NERDTree when open a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * wincmd p

" prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#tab_width = '2'
let g:prettier#config#trailing_comma = 'all'
autocmd BufWritePre *.tsx,*.ts,*.js,*.jsx,*.css,*.scss,*.html,*.vue Prettier

" Coc
let g:coc_global_extensions = ['coc-tsserver','coc-emmet','coc-html','coc-json','coc-pairs','coc-css','coc-eslint']

" better on-enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" tab for auto completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" fzf
nnoremap <Leader>f :Files .<CR>
nnoremap <Leader>g :GFiles?<CR>

" camelCaseMotion
map <silent> \w <Plug>CamelCaseMotion_w
map <silent> \b <Plug>CamelCaseMotion_b
map <silent> \e <Plug>CamelCaseMotion_e
map <silent> \ge <Plug>CamelCaseMotion_ge
