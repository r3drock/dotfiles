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
Plugin 'tpope/vim-commentary'
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
Plugin 'lervag/vimtex'
Plugin 'easymotion/vim-easymotion'
Plugin 'mboughaba/i3config.vim'
"Plugin 'vim-syntastic/syntastic' maybe in the future I will use this
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
map <F3> :!make<cr>
map <F4> :!make qemu<cr>
"map <F4> :!make `echo "run%:p:h:t"`<cr>
map <F5> :!cargo build<cr><cr>
map <F7> bPldw
map <C-J> i<cr><Esc>k$
set mouse=
set secure
syntax on
set tabstop=4
set autoindent
set incsearch
set softtabstop=4
set shiftwidth=4
set rnu
"do not replace tabs with spaces
set noexpandtab 

"set colorcolumn=80
"highlight ColorColumn ctermbg=darkgray
let overlength#default_overlength = 80
"call overlength#set_overlength('markdown', 0)

let g:seoul256_background = 235
colo seoul256

let g:ycm_warning_symbol = '**'
let g:ycm_error_symbol = '->'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_latexlog = {'default' : 0}

"automatic closing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap [ []<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"i3config syntax highlighting"
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
