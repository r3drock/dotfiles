set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tjdevries/overlength.vim'
Plug 'pangloss/vim-javascript'
Plug 'lervag/vimtex'
"Plug 'easymotion/vim-easymotion'
Plug 'mboughaba/i3config.vim'
"Plug 'vim-syntastic/syntastic' maybe in the future I will use this
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'baeuml/summerfruit256.vim'
Plug 'gu-fan/InstantRst'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "on demand loading
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' } "on demand loading
Plug 'rust-lang/rust.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'chase/vim-ansible-yaml', { 'for': 'yaml' }
Plug 'tkztmk/vim-vala'

"maybe interesting plugins
""" Using a non-master branch
""Plug 'SirVer/ultisnips'
""Plug 'honza/vim-snippets'
""" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
""Plug 'junegunn/vim-easy-align'
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
""Plug 'tpope/vim-fugitive'
""Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()

" airline configuration
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0 " disable whitespace checks
let g:airline_theme = 'gruvbox'

"linenumbers
set number
set numberwidth=4

"linewrap
set wrap 

"spellchecking
set spell spelllang=de
set nospell
"set spell spelllang=en_us
map <F5> 1z=

" needs wl-clipboard to work
" use system clipboard
set clipboard+=unnamedplus

" leave system clipboard unchanged upon closing vim
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" syntax highlighting for odd filetypes
autocmd BufNewFile,BufRead *.cl set syntax=c
"autocmd FileType yaml setlocal list listchars+=trail:◦
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·



"automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

map <C-n> :NERDTreeToggle<CR>
nmap <silent> cp "_ciw<C-R>+<Esc>
map <F2> :w<cr>
map <F3> :silent !make<cr>
map <F4> :!make qemu<cr>
"map <F4> :!make `echo "run%:p:h:t"`<cr>
map <F7> "_diwP
map Y y$
map <c-s> i<cr><Esc>k$
set mouse=nv
set secure
syntax on
set tabstop=4
set autoindent
set incsearch
set hlsearch
set ignorecase
set smartcase
set softtabstop=4
set shiftwidth=4

"do not replace tabs with spaces
set expandtab 

"set colorcolumn=80
"highlight ColorColumn ctermbg=darkgray
let overlength#default_overlength = 81
"call overlength#set_overlength('markdown', 0)
set tw=80

let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_contrast_light = "hard"
let g:gruvbox_hls_cursor= "orange"
"set background=light
"colo gruvbox
colo summerfruit256
let g:seoul256_background = 256

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_latexlog = {'default' : 0}


"automatic closing brackets
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"i3config syntax highlighting"
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/sway/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"python 
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
filetype plugin indent on

"The Leader
let mapleader="\<Space>"
"replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

"move to the split in the direction shown, or create a new split
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>
"close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>
"Tab to switch to next open buffer
nnoremap <tab> :bnext<cr>
"Shift + Tab to switch to previous open buffer
nnoremap <s-tab> :bprevious<cr>
"leader key twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
