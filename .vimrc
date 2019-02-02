set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'tjdevries/overlength.vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'junegunn/seoul256.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update 
" :PluginUpdate		- updates plugins;
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; 
" append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"""""""""""""""""""""""""""""""""""""""""""""""
" airline configuration
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0 " disable whitespace checks
let g:airline_theme = 'murmur'

"linenumbers
set number
set numberwidth=4

"linewrap
set wrap 

" use system clipboard
set clipboard=unnamedplus

" leave system clipboard unchanged upon closing vim
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"Close window if last active window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")&& b:NERDTree.isTabTree()) | q | endif
"automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

map <C-n> :NERDTreeToggle<CR>
map <F2> :w<cr>
map <F3> :!cargo check<cr>
map <F4> :!cargo run<cr>
map <F5> :!cargo build<cr><cr>
map <F7> bPldw
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
set mouse=
set secure
syntax on
set tabstop=4
set autoindent
set incsearch
set softtabstop=4
set shiftwidth=4
"do not replace tabs with spaces
set noexpandtab 

"set colorcolumn=80
"highlight ColorColumn ctermbg=darkgray
let overlength#default_overlength = 800
"call overlength#set_overlength('markdown', 0)

let g:seoul256_background = 235
colo seoul256
