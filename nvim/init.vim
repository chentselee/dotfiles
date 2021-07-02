" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tomtom/tcomment_vim'
    Plug 'bkad/CamelCaseMotion'
    Plug 'jiangmiao/auto-pairs'

    Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" base
language en_US
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
" colorscheme OceanicNext
colorscheme PaperColor

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
" toggle quickfix and location list
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
nnoremap <silent> <Leader>cq :call ToggleQuickFix()<CR>
function! ToggleLocationList()
  if empty(filter(getwininfo(), 'v:val.loclist'))
    lopen
  else
    lclose
  endif
endfunction
nnoremap <silent> <Leader>cl :call ToggleLocationList()<CR>

" >> Telescope bindings
nnoremap <Leader>pp :lua require'telescope.builtin'.builtin{}<CR>

" most recentuly used files
nnoremap <Leader>m :lua require'telescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap ; :lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <Leader>/ :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' :lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <Leader>f :lua require'telescope.builtin'.git_files{}<CR>

" all files
nnoremap <Leader>bfs :lua require'telescope.builtin'.find_files{}<CR>

" ripgrep like grep through dir
nnoremap <Leader>rg :lua require'telescope.builtin'.live_grep{}<CR>

" pick color scheme
nnoremap <Leader>cs :lua require'telescope.builtin'.colorscheme{}<CR>


" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>

" >> camelCaseMotion
map <silent> \w <Plug>CamelCaseMotion_w
map <silent> \b <Plug>CamelCaseMotion_b
map <silent> \e <Plug>CamelCaseMotion_e
map <silent> \ge <Plug>CamelCaseMotion_ge

" >> emmet-vim
let g:user_emmet_mode='i'

lua <<EOF
require("lsp")
require("treesitter")
require("statusbar")
require("completion")
EOF
