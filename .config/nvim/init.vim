  " Install Vim Plug if not installed
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall
    endif

    call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug '~/.fzf' | Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neosnippet.vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
    call plug#end()

source ~/.config/nvim/basic.vim

set noai

set history=1000

set number

set showbreak=↪\
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨," eol:↲,nbsp:·,
set list

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Theme
let g:onedark_termcolors=256
set background=dark
colorscheme onedark
hi SpecialKey ctermfg=8
set termguicolors
set cc=80

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Look
autocmd VimEnter * NERDTreeToggle

" Plugins
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 1

let g:sneak#use_ic_scs = 1

let mapleader = ","
let g:mapleader = ","

" ale auto fix
"let g:ale_fixers = {
" /  'javascript': ['eslint'],
" 'css': ['prettier'],
" /}
 let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
" Fix files automatically on save
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

nmap <leader>f :GFiles<CR>
nmap <leader>F :GFiles?<CR>
nmap gs  <plug>(GrepperOperator)
set laststatus=2
set mouse=
set completeopt=menu,menuone,preview,noselect,noinsert

nmap <silent> gd <Plug(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <C-A> ggVG
map <esc> :noh<cr>
autocmd BufWritePre *.go :CocCommand editor.action.organizeImport
