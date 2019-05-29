set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-sensible'
Plug 'tjdevries/overlength.vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'lervag/vimtex'
"Plug 'easymotion/vim-easymotion'
Plug 'mboughaba/i3config.vim'
"Plug 'vim-syntastic/syntastic' maybe in the future I will use this
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/seoul256.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "on demand loading
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' } "on demand loading
Plug 'wincent/Command-T'
Plug 'ap/vim-buftabline'

"maybe interesting plugins
""" Using a non-master branch
""Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
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
let g:airline_theme = 'murmur'

"linenumbers
set number
set numberwidth=4

"linewrap
set wrap 

" needs wl-clipboard to work
" use system clipboard
set clipboard+=unnamedplus

" leave system clipboard unchanged upon closing vim
"autocmd VimLeave * call system("xsel -ib", getreg('+'))

"automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

map <C-n> :NERDTreeToggle<CR>
map <F2> :w<cr>
map <F3> :!make<cr>
map <F4> :!make qemu<cr>
"map <F4> :!make `echo "run%:p:h:t"`<cr>
map <F7> bPldw
map <c-s> i<cr><Esc>k$
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
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"i3config syntax highlighting"
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/sway/config set filetype=i3config
aug end

"The Leader
let mapleader="\<Space>"
"replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>
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

